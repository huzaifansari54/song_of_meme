import 'package:dio/dio.dart';
import 'package:song_of_meme/src/core/exeption/failure_model.dart';

class ServerException implements Exception {
  final String message;
  final String status;
  const ServerException({required this.message, required this.status});
}

class ApiException implements Exception {
  final String message;
  final String? status;
  final ApiFailure? failure;
  const ApiException(
      {required this.failure, required this.message, required this.status});
}
