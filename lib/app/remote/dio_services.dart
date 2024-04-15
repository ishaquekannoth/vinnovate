import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:vinnovate/app/remote/dio_interceptor.dart';
import 'package:vinnovate/app/utilities/strings.dart';


import 'network_enums.dart';

class DioService {
  static Future<Response> makeRESTrequest<T extends Object>(
      {required String urlPath,
      String? baseUrl,
      BaseOptions? baseOptions,
      List<Interceptor>? specificInterceptors,
      required RequestMethod method,
      T? data}) async {
    Dio dio = Dio(baseOptions == null
        ? BaseOptions(
            baseUrl: UrlStrings.baseUrl,
            method: method.getMethodName,
            receiveTimeout: const Duration(seconds: 10))
        : baseOptions.copyWith(
            baseUrl: UrlStrings.baseUrl,
            method: method.getMethodName,
            receiveTimeout: const Duration(seconds: 10)));

    if (specificInterceptors != null) {
      dio.interceptors.addAll(specificInterceptors);
    }
    dio.interceptors.addAll(
      [
        RetryInterceptor(
            retries: 1,
            retryEvaluator: (error, attempt) =>
                error.error is! SocketException &&
                error.type == DioExceptionType.connectionTimeout,
            logPrint: (message) => log(message),
            dio: dio),
        DefaultInterceptor(),
      ],
    );

    switch (method) {
      case RequestMethod.getRequest:
        return dio.get(urlPath, data: data).then((value) => value);
      case RequestMethod.postRequest:
        return dio.post(urlPath, data: data).then((value) => value);
      case RequestMethod.putRequest:
        return dio.put(urlPath, data: data).then((value) => value);
      case RequestMethod.deleteRequest:
        return dio.delete(urlPath, data: data).then((value) => value);
      case RequestMethod.patchRequest:
        return dio.patch(urlPath, data: data).then((value) => value);
      case RequestMethod.headRequest:
        return dio.head(urlPath, data: data).then((value) => value);
    }
  }
}
