import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:matricular/LoginError.dart';
import 'package:matricular/LoginModel.dart';
import 'package:matricular/api.dart';

class LoginRepository {
  final Dio _dio = Dio(dioOptions);

  Future<Either<LoginError, LoginModel>> login(String login, String senha) async {
    try {
      var params =  {
      "login": login,
      "senha": senha,
      };
      final response = await _dio.post('/api/v1/auth/login',
        data: json.encode(params),
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        })
      );
      final loginModel = LoginModel.fromMap(response.data);
      return Right(loginModel);
    } on DioException catch (error) {
      final response = error.response;
      if (response != null) {
        return Left(LoginRepositoryError(response.data['error']));
      } else {
        return Left(LoginRepositoryError(serverError));
      }
    } on Exception catch (error) {
      return Left(LoginRepositoryError(error.toString()));
    }
  }
}