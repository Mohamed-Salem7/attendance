import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://attendence.qtrsoft.com/api',
          receiveDataWhenStatusError: true,
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
    );
  }


  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> deleteUser({
    required String? token,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };
    return await dio.delete('/settings/delete-account');
  }





  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'en',
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      //'Authorization': 'key=AAAAOQOhCMU:APA91bHbIXIwZxJClaJKJ7PfbrUXjaXE-rCA5EKGb46PbBK_-qck4plwOaWqh4t16AQVVNKTfs_NbDbqHFzbUAYChfzK2hFUPfmjMumUszoHDDrL9Ut-26hPuCwu-9jySSa5W0DKfOob',
    };
    return dio.post(url, queryParameters: query, data: data);
  }

}
