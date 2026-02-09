import 'dart:io';

import 'package:dio/dio.dart';

import '../errors/failure.dart';

class ApiErrorHandler {
  static Failure handleDioError({required DioException error}) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return Failure(message: 'Connection time out with API server');

      case DioExceptionType.receiveTimeout:
        return Failure(message: 'Receive time out with API server');

      case DioExceptionType.sendTimeout:
        return Failure(message: 'Send time out with API server');

      case DioExceptionType.badCertificate:
        return Failure(message: 'Bad certificate with API server');

      case DioExceptionType.badResponse:
        if (error.response != null) {
          return _handleBadResponse(response: error.response!);
        }
        return Failure(message: 'Received invalid response from API server');

      case DioExceptionType.cancel:
        return Failure(message: 'Request to API server was cancelled');

      case DioExceptionType.connectionError:
        return Failure(message: 'Connection error with API server');

      case DioExceptionType.unknown:
        if (error.error is SocketException) {
          return Failure(message: 'No internet connection. Please check your network settings.');
        }
        return Failure(message: 'Unexpected error occurred while communicating with API server');
    }
  }

  static Failure _handleBadResponse({required Response response}) {
    final statusCode = response.statusCode;
    final data = response.data;

    if (data is! Map<String, dynamic>) {
      return Failure(
        message: 'Unexpected response format',
        code: statusCode,
      );
    }

    switch (statusCode) {
      case 400:
        return Failure(
          message: data['message'] ?? 'Bad request',
          code: statusCode,
        );

      case 401:
        // LocalStorageService().destroyAll();
        // NavigationService.navigateToLogin();
        return Failure(
          message: data['message'] ?? 'Unauthorized access. Please login again.',
          code: statusCode,
        );

      case 403:
        return Failure(
          message: data['message'] ??
              'Forbidden access. Please login again.',
          code: statusCode,
        );

      case 404:
        return Failure(
          message: data['message'] ??
              'Resource not found',
          code: statusCode,
        );

      case 413:
        return Failure(
          message: 'Request entity too large',
          code: statusCode,
        );

      case 422:
        if (data['errors'] is Map<String, dynamic>) {
          return Failure(
            message: _extractValidationError(
              error: Map<String, dynamic>.from(data['errors']),
            ),
            code: statusCode,
          );
        }
        return Failure(
          message: data['message'] ?? 'Validation error',
          code: statusCode,
        );

      case 500:
        return Failure(
          message: data['message'] ?? 'Internal server error',
          code: statusCode,
        );

      default:
        return Failure(
          message: 'Something went wrong',
          code: statusCode,
        );
    }
  }

  static String _extractValidationError({
    required Map<String, dynamic> error,
  }) {
    return error.entries
        .map((e) => "${e.key}: ${(e.value as List).join(', ')}")
        .join('\n');
  }
}
