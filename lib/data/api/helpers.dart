import 'package:assigment/const/url.dart';

import 'package:dio/dio.dart';

import 'error.dart';
import 'interceptors.dart';

class ApiBaseHelper {
  static const String url = baseUrl;
  static BaseOptions opts = BaseOptions(
    baseUrl: url,
    responseType: ResponseType.json,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  );

  static Dio createDio() {
    return Dio(opts);
  }

  static Dio addInterceptors(Dio dio) {
    return dio..interceptors.add(DioInterceptor());
  }

  static final dio = createDio();
  static final baseAPI = addInterceptors(dio);

  Future<Object> getHTTP(String url) async {
    try {
      Response response = await baseAPI.get(url);
      return response;
    } on DioError catch (e) {
      return DioException.fromDioError(e);
    }
  }

  Future<Object> postHTTP(String url, dynamic data) async {
    try {
      Response response = await baseAPI.post(url, data: data);
      return response;
    } on DioError catch (e) {
      // Handle error
      return DioException.fromDioError(e);
    }
  }

  Future<Object> putHTTP(String url, dynamic data) async {
    try {
      Response response = await baseAPI.put(url, data: data);
      return response;
    } on DioError catch (e) {
      // Handle error
      return DioException.fromDioError(e);
    }
  }

  Future<Object> deleteHTTP(String url) async {
    try {
      Response response = await baseAPI.delete(url);
      return response;
    } on DioError catch (e) {
      // Handle er
      return DioException.fromDioError(e);
    }
  }
}
