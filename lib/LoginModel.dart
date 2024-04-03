// ignore: file_names
import 'dart:convert';
import 'dart:core';

class LoginModel {
  final int id;
  final String nome;
  final String login;
  final String email;
  final List<dynamic> roles;
  final String accessToken;
  final int expiresIn;
  final String refreshToken;
  final int refreshExpiresIn;
  final bool statusAtivo;

  LoginModel({
    required this.id,
    required this.nome,
    required this.login,
    required this.email,
    required this.roles,
    required this.accessToken,
    required this.expiresIn,
    required this.refreshToken,
    required this.refreshExpiresIn,
    required this.statusAtivo,
  });

  factory LoginModel.fromJson(String str) =>
    LoginModel.fromMap(json.decode(str));

  factory LoginModel.fromMap(Map<String, dynamic> json) =>
    LoginModel(
      id: json["id"],
      nome: json["nome"],
      login: json["login"],
      email: json["email"],
      roles: json["roles"],
      accessToken: json["accessToken"],
      expiresIn: json["expiresIn"],
      refreshToken: json["refreshToken"],
      refreshExpiresIn: json["refreshExpiresIn"],
      statusAtivo: json["statusAtivo"],
    );

    
}