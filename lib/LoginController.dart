import 'package:dartz/dartz.dart';
import 'package:matricular/LoginError.dart';
import 'package:matricular/LoginModel.dart';
import 'package:matricular/LoginRepository.dart';

class LoginController {
  final _repository = LoginRepository();

  late LoginModel loginModel;
  late LoginError loginError;
  
  Future<void> login(String login, String senha) async {
    final result = await _repository.login(login, senha);
    result.fold((error) => loginError = error, (detail) => loginModel = detail);
    print(loginModel.accessToken);
  }
}