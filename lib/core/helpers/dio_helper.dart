import 'dart:developer';

import 'package:dio/dio.dart';

class DioHelper {
  late Dio dio;

  DioHelper([String? baseUrl]) {
    init(baseUrl);
  }

  init([String? baseUrl]) {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl ?? 'https://api.alquran.cloud/v1/',
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
      ),
    )..interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          requestHeader: true,
          responseHeader: true,
          logPrint: (logging) {
            log(logging.toString());
          },
        ),
      );
  }

  Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
    };
    return await dio.get(url, queryParameters: query);
  }

  Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
    };
    return await dio.post(url, data: data);
  }
}
