import 'package:dio/dio.dart';
import 'package:vinnovate/app/data/product_model.dart';
import 'package:vinnovate/app/remote/api_result.dart';
import 'package:vinnovate/app/remote/dio_exceptions.dart';
import 'package:vinnovate/app/remote/dio_services.dart';
import 'package:vinnovate/app/remote/network_enums.dart';
import 'package:vinnovate/app/utilities/strings.dart';

class HomeRepo {
  static final HomeRepo _instance = HomeRepo._internal();
  factory HomeRepo() => _instance;
  HomeRepo._internal();
  Future<Result> getProductList() async {
    try {
      final Response response = await DioService.makeRESTrequest(
        urlPath: UrlStrings.baseUrl,
        method: RequestMethod.getRequest,
        baseOptions: BaseOptions(
          queryParameters: {
            "limit": 100,
          },
        ),
      );
      try {
        final List productsJson = response.data;
        return Result<List<ProductModel>>.success(
            successResponse:
                productsJson.map((e) => ProductModel.fromJson(e)).toList());
      } catch (e) {
        throw ResponseParsingException();
      }
    } on DioException catch (e) {
      return Result<Failure>.failure(
          failure: CustomDioExceptions.fromDioError(
              dioError: e,
              messageType: ErrorMessageType.messageFromResponseBody,
              messagePath: "message"));
    } on ResponseParsingException catch (e) {
      return Result<Failure>.failure(
          failure: Failure(
              errorType: DioExceptionType.unknown,
              statusMessage: e.toString()));
    } catch (e) {
      return Result<Failure>.failure(
          failure: Failure(
              errorType: DioExceptionType.unknown,
              statusMessage: "oops..Something went wrong"));
    }
  }
}
