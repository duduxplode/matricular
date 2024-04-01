import 'package:dio/dio.dart';

const baseUrl = 'http://200.137.241.49:8080';
const serverError = 'Falha ao conectar no servidor';
final dioOptions = BaseOptions(
  baseUrl: baseUrl,
  connectTimeout: const Duration(milliseconds: 5000),
  receiveTimeout: const Duration(milliseconds: 3000),
  contentType: 'application/json;charset=utf-8',
);