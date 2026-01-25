import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../env/environment.dart';
import 'request_handler.dart';



class ApiClient {
  late final Dio _dio;

  ApiClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: Environment.apiBaseUrl, // 🔥 IMPORTANT
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      ),
    );

    /// ✅ Add all interceptors here
    ApiInterceptors.addInterceptors(_dio);
  }

  /// ======================
  /// Default Headers
  /// ======================
  final Map<String, dynamic> _defaultHeaders = {
    HttpHeaders.authorizationHeader: null,
  };

  Options _options([Map<String, dynamic>? headers]) {
    return Options(
      headers: headers ?? _defaultHeaders,
      followRedirects: false,
      validateStatus: (status) => status != null && status <= 500,
    );
  }

  /// ======================
  /// HTTP METHODS
  /// ======================

  Future<Response> get(
    String url, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) {
    return _dio.get(
      url,
      queryParameters: query,
      options: _options(headers),
    );
  }

  Future<Response> post(
    String url, {
    dynamic data,
    Map<String, dynamic>? headers,
  }) {
    return _dio.post(
      url,
      data: data,
      options: _options(headers),
    );
  }

  Future<Response> put(
    String url, {
    dynamic data,
    Map<String, dynamic>? headers,
  }) {
    return _dio.put(
      url,
      data: data,
      options: _options(headers),
    );
  }

  Future<Response> delete(
    String url, {
    dynamic data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) {
    return _dio.delete(
      url,
      data: data,
      queryParameters: query,
      options: _options(headers),
    );
  }

  /// ======================
  /// TOKEN HANDLING
  /// ======================
  void updateToken(String token) {
    _defaultHeaders[HttpHeaders.authorizationHeader] = 'Bearer $token';
    debugPrint('🔐 Token Updated');
  }

  void clearToken() {
    _defaultHeaders[HttpHeaders.authorizationHeader] = null;
  }
}
