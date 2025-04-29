// ignore_for_file: public_member_api_docs

import 'package:dio/dio.dart';

abstract class IHttpClient {
  Future<Response<dynamic>> getHttp(
    String route, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
    bool formdata = false,
    bool authenticate = false,
  });

  Future<Response<dynamic>> postHttp(
    String route,
    dynamic body, {
    Map<String, dynamic>? params,
    bool formdata = false,
    bool formEncoded = false,
    bool authenticate = false,
    void Function({int count, int total})? onSendProgress,
    void Function({int count, int total})? onRecieveProgress,
  });

  Future<Response<dynamic>> putHttp(
    String route,
    dynamic body, {
    Map<String, dynamic>? params,
    bool formdata = false,
    bool formEncoded = false,
    bool authenticate = false,
  });

  Future<Response<dynamic>> patchHttp(
    String route,
    dynamic body, {
    Map<String, dynamic>? params,
    bool formdata = false,
    bool formEncoded = false,
    bool authenticate = false,
  });

  Future<Response<dynamic>> deleteHttp(
    String route,
    dynamic body, {
    Map<String, dynamic>? params,
    bool authenticate = false,
  });

  Future<Response<dynamic>> makeRequest(Future<Response<dynamic>> future);

  Future<void> dispose();
}
