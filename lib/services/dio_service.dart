import 'dart:io';
import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sipayu/constants/session_constant.dart';

class DioService {
  Dio get dio => _dio();
  GetStorage session = GetStorage();
  Dio _dio() {
    final options = BaseOptions(
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        baseUrl: 'https://be-sipayu.indramayukab.go.id/public/api/',
        validateStatus: (status) {
          return status! < 500;
        },
        headers: {
          "Accept": "application/json",
          if (session.hasData(SessionConstant.token))
            "Authorization": "Bearer ${session.read(SessionConstant.token)}",
        });

    final dio = Dio(options);
    // ignore: deprecated_member_use
    (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));

    return dio;
  }
}
