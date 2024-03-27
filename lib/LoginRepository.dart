import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:matricular/LoginError.dart';
import 'package:matricular/LoginModel.dart';
import 'package:matricular/api.dart';

class LoginRepository {
  final Dio _dio = Dio(dioOptions);

  Future<Either<LoginError, LoginModel>> login(String login, String senha) {
    try {
      final response = await _dio.get('/api/v1/auth/login');
      final loginModel = LoginModel.fromMap(response.data);
      return loginModel;
    } on DioException catch (error) {
      return Left(LoginRepositoryError(error.response.data['message']));
    }
  }
}