import 'dart:developer';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      options.headers["accept"] = "application/json";
      // if Authorization or other generall headers needed, it can be added here
      //options.headers["Authorization"] = token;
    } catch (e) {
      log(e.toString());
    }
    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    log(err.toString());
    return super.onError(err, handler);
  }
}
