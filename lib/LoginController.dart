import 'package:dartz/dartz.dart';
import 'package:matricularApp/LoginError.dart';
import 'package:matricularApp/LoginModel.dart';
import 'package:matricularApp/LoginRepository.dart';

class LoginController {
  final _repository = LoginRepository();

  late LoginModel loginModel = LoginModel(id: 0, nome: "", login: "", email: "", roles: List.empty(), accessToken: "", expiresIn: 0, refreshToken: "", refreshExpiresIn: 0, statusAtivo: false);
  late LoginError loginError;
  
  Future<Either<LoginError, LoginModel>> login(String login, String senha) async {
    final result = await _repository.login(login, senha);
    result.fold((error) => loginError = error, (detail) => loginModel = detail);
    print(loginModel.accessToken);
    return result;
  }

}