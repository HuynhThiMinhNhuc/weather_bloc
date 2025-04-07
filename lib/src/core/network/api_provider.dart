import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:example_app/src/core/config/app_constant.dart';
import 'package:example_app/src/core/config/enums/app_env.dart';
import 'package:example_app/src/core/network/api_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class APIProvider {
  late Dio _dio;

  APIProvider(AppEnv env, {bool isStub = false}) {
    final dioOptions = BaseOptions();
    dioOptions.connectTimeout = AppDurations.tenSeconds;
    dioOptions.receiveTimeout = AppDurations.tenSeconds;
    dioOptions.receiveTimeout = AppDurations.tenSeconds;
    dioOptions.baseUrl = env.baseUrl;
    dioOptions.responseType = ResponseType.json;

    _dio = Dio(dioOptions);
    _dio.interceptors.add(ApiInterceptor());

    if (env.isDev || kDebugMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          compact: false,
        ),
      );
    }
  }

  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? params,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.get(
      path,
      queryParameters: params,
      cancelToken: cancelToken,
    );
    throwIfNoSuccess(response);
    if (response.data is String) {
      return jsonDecode(response.data.toString());
    } else {
      return response.data;
    }
  }

  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? params,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.post(
      path,
      data: params,
      cancelToken: cancelToken,
    );
    throwIfNoSuccess(response);

    if (response.data is String) {
      return jsonDecode(response.data.toString());
    } else {
      return response.data;
    }
  }

  void throwIfNoSuccess(Response response) {
    if (response.statusCode == null) throw HttpException(response);
    if (response.statusCode! < 200 || response.statusCode! > 299) {
      throw HttpException(response);
    }
  }
}

class HttpException implements Exception {
  Response response;

  HttpException(this.response);
}
