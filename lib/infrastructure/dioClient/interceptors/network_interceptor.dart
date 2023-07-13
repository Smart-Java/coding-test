import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:login_system/infrastructure/dioClient/connectivityManager/model/connection.dart';

@lazySingleton
class NetworkInterceptor extends Interceptor {
  NetworkInterceptor(
    this._connection,
  );
  final Connection _connection;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      final isInternetEnabled = await _connection.isInternetEnabled();
      if (isInternetEnabled) return handler.next(options);
      handler
          .reject(DioException(requestOptions: options, type: DioExceptionType.cancel));
    } on DioException catch (ex) {
      throw FormatException(ex.message ?? 'Unknown error occured');
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint(err.message);
    return handler.reject(err);
  }
}
