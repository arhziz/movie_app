// ignore_for_file: public_member_api_docs

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_api_firestore/src/common/common.dart';

@dev
@Injectable(as: IHttpClient)
class HttpClient implements IHttpClient {
  HttpClient({required DioClient api, required DioClientNoAuth apiNoAuth})
      : _api = api,
        _apiNoAuth = apiNoAuth;
  final DioClient _api;
  final DioClientNoAuth _apiNoAuth;

  @override
  Future<Response<dynamic>> deleteHttp(
    String route,
    dynamic body, {
    Map<String, dynamic>? params,
    bool authenticate = false,
  }) {
    if (authenticate) {
      return _api.client.delete(
        route,
        data: body,
        queryParameters: params,
      );
    } else {
      return _apiNoAuth.client.delete(
        route,
        data: body,
        queryParameters: params,
      );
    }
  }

  @override
  Future<Response<dynamic>> getHttp(
    String route, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
    bool formdata = false,
    bool authenticate = false,
  }) {
    if (authenticate) {
      return _api.client.get(
        route,
        data: body,
        queryParameters: params,
      );
    } else {
      return _apiNoAuth.client.get(
        route,
        data: body,
        queryParameters: params,
      );
    }
  }

  @override
  Future<Response<dynamic>> makeRequest(Future<Response<dynamic>> future) {
    throw UnimplementedError();
  }

  @override
  Future<Response<dynamic>> postHttp(
    String route,
    dynamic body, {
    Map<String, dynamic>? params,
    bool formdata = false,
    bool formEncoded = false,
    bool authenticate = false,
    void Function({int count, int total})? onSendProgress,
    void Function({int count, int total})? onRecieveProgress,
  }) async {
    params?.removeWhere((key, value) => value == null);

    if (formdata) {
      body = FormData.fromMap(body as Map<String, dynamic>);
    }
    if (authenticate) {
      return _api.client.post(
        route,
        data: body,
        onSendProgress: (count, total) {
          if (onSendProgress != null) {
            onSendProgress(count: count, total: total);
          }
        },
        onReceiveProgress: (count, total) {
          if (onRecieveProgress != null) {
            onRecieveProgress(count: count, total: total);
          }
        },
        queryParameters: params,
      );
    } else {
      return _apiNoAuth.client.post(
        route,
        data: body,
        onSendProgress: (count, total) {
          if (onSendProgress != null) {
            onSendProgress(count: count, total: total);
          }
        },
        onReceiveProgress: (count, total) {
          if (onRecieveProgress != null) {
            onRecieveProgress(count: count, total: total);
          }
        },
        queryParameters: params,
      );
    }
  }

  @override
  Future<Response<dynamic>> putHttp(String route, dynamic body,
      {Map<String, dynamic>? params,
      bool formdata = false,
      bool authenticate = false,
      bool formEncoded = false,}) {
    if (formdata) {
      body = FormData.fromMap(body as Map<String, dynamic>);
    }
    if (authenticate) {
      return _api.client.put(
        route,
        data: body,
        queryParameters: params,
      );
    } else {
      return _apiNoAuth.client.put(
        route,
        data: body,
        queryParameters: params,
      );
    }
  }

  @override
  Future<Response<dynamic>> patchHttp(String route, dynamic body,
      {Map<String, dynamic>? params,
      bool formdata = false,
      bool formEncoded = false,
      bool authenticate = false,}) {
    if (formdata) {
      body = FormData.fromMap(body as Map<String, dynamic>);
    }
    if (authenticate) {
      return _api.client.patch(
        route,
        data: body,
        queryParameters: params,
      );
    } else {
      return _apiNoAuth.client.patch(
        route,
        data: body,
        queryParameters: params,
      );
    }
  }

  @override
  Future<void> dispose() async {
    _api.client.close();
    _apiNoAuth.client.close();
  }
}
