import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vinnovate/app/remote/api_result.dart';
import 'package:vinnovate/app/remote/dio_exceptions.dart';

class LoginRepo {
  static final LoginRepo _instance = LoginRepo._internal();
  factory LoginRepo() => _instance;
  LoginRepo._internal();
  Future<Result> loginUser(
      {required String emailAddress, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return Result.success(successResponse: credential);
    } on FirebaseAuthException catch (e) {
      return Result<Failure>.failure(
          failure: Failure(
              errorType: DioExceptionType.unknown, statusMessage: e.message));
    } on DioException catch (e) {
      return Result<Failure>.failure(
          failure: CustomDioExceptions.fromDioError(
        dioError: e,
      ));
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
