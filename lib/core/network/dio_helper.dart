import 'package:dio/dio.dart';
import 'package:paymob/core/network/contant.dart';

class DioHelper {
  static late Dio dio;

  static initDio() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiContext.baseUrl,
        headers: {
          "Content-Type": "application/json",
        },
        receiveDataWhenStatusError: false,
      ),
    );
  }

  static Future<Response> postDataDio({
    required String url,
    Map<String, dynamic>? data,
  }) async {
    return await dio.post(
      url,
      data: data,
    );
  }
}
