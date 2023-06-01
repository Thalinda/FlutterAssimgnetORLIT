import 'dart:developer';

import 'package:dio/dio.dart';

class DioException implements Exception {
  late String errorMessage;

  DioException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        errorMessage = 'Request to the server was cancelled.';
        break;
      case DioErrorType.connectionTimeout:
        errorMessage = 'Connection timed out.';
        break;
      case DioErrorType.receiveTimeout:
        errorMessage = 'Receiving timeout occurred.';
        break;
      case DioErrorType.sendTimeout:
        errorMessage = 'Request send timeout.';
        break;
      case DioErrorType.badResponse:
        errorMessage = _handleStatusCode(
            dioError.response?.statusCode, dioError.response?.data['message']);
        break;
      case DioErrorType.unknown:
        if (dioError.message!.contains('SocketException')) {
          errorMessage = 'No Internet.';
          break;
        }
        errorMessage = 'Unexpected error occurred.';
        break;
      default:
        errorMessage = 'Something went wrong';
        break;
    }
  }

  String _handleStatusCode(int? statusCode, String message) {
    log("Code $statusCode");
    switch (statusCode) {
      case 400:
        return message;
      case 401:
        return message;
      case 403:
        return message;
      case 404:
        return message;
      case 405:
        return message;
      case 415:
        return message;
      case 422:
        return message;
      case 429:
        return message;
      case 500:
        return message;
      default:
        return message;
    }
  }

  @override
  String toString() => errorMessage;
}
