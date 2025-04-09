import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

enum Status {
  success,
  error,
  cancel,
  noInternet,
  timeout,
  clientError,
  serverError,
  invalidApiKeyException,
  unknown,
}

extension StatusExts on Status {
  String get message {
    switch (this) {
      case Status.success:
        return 'Sucessfully!';
      case Status.error:
        return 'There are some errors occured. Please try again later!';
      case Status.cancel:
        return 'Cancel request!';
      case Status.noInternet:
        return 'No internet connection. Please check your connectio and try again!';
      case Status.timeout:
        return 'The request take to much time to response!';
      case Status.clientError:
        return 'There are some errors occured, please check your information and try again!';
      case Status.serverError:
        return 'There are some errors occured from server, please try again!';
      case Status.invalidApiKeyException:
        return 'Invalid API key!';
      case Status.unknown:
        return 'Unknown error!';
    }
  }
}

class ResponseData<T> {
  Status? status;
  T? data;
  String? message = '';

  bool get isSuccess => status == Status.success;

  ResponseData.success(this.data, {dynamic response}) {
    status = Status.success;
    if (response is Map<String, dynamic>) {
      final statusCode = response['statusCode'];
      if (statusCode != null) {
        status = _mapCodeToState(statusCode);
        message = response['message'] ?? response['error'];
      }
    }

    message = message?.isEmpty == true ? status?.message : message;
  }
  ResponseData.error(dynamic error) {
    if (error is DioException || error is DioExceptionType) {
      status = _mapErrorToState(error);
      try {
        final json = jsonDecode(error?.response.toString() ?? '');
        if (json == null) {
          message = status?.message;
        } else {
          message = json['message'].toString();
          message = message == 'null' ? json['error'].toString() : message;
        }
      } catch (e) {
        message = status?.message;
      }
    } else {
      status = Status.error;
      message = error.toString();
    }
  }

  Status _mapCodeToState(int code) {
    if (code >= 200 && code <= 299) {
      return Status.success;
    }
    if (code >= 400 && code <= 499) {
      return Status.clientError;
    }
    if (code >= 500 && code >= 599) {
      return Status.serverError;
    }
    return Status.unknown;
  }

  Status _mapErrorToState(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.cancel:
          return Status.cancel;
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
          return Status.timeout;
        case DioExceptionType.connectionError:
          return Status.noInternet;
        case DioExceptionType.badResponse:
          if (error.error is SocketException) {
            return Status.noInternet;
          }
          return Status.error;

        case DioExceptionType.unknown:
        case DioExceptionType.badCertificate:
          return Status.error;
      }
    } else if (error is SocketException) {
      return Status.noInternet;
    }
    return Status.error;
  }

  @override
  String toString() {
    return 'Status : $status \n Message : $message \n Data : $data';
  }
}
