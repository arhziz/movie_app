// import 'package:http/http.dart' as http;
// import 'package:injectable/injectable.dart';
// import 'package:mocktail/mocktail.dart';

// import 'package:movie_app_api_firestore/src/common/common.dart';

// class MockHttpClient extends Mock implements http.Client{} 

// @LazySingleton(as: IHttpClient)
// class HttpClientMock extends IHttpClient {
//   @override
//   Future<Response> deleteHttp(String route, body,
//       {Map<String, dynamic>? params, bool authenticate = false}) {
//     // `TODO`: implement deleteHttp
//     throw UnimplementedError();
//   }

//   @override
//   Future<Response> getHttp(String route,
//       {Map<String, dynamic>? body,
//       Map<String, dynamic>? params,
//       bool formdata = false,
//       bool authenticate = false}) {
//     // `TODO`: implement getHttp
//     throw UnimplementedError();
//   }

//   @override
//   Future<Response> makeRequest(Future<Response> future) {
//     // `TODO`: implement makeRequest
//     throw UnimplementedError();
//   }

//   @override
//   Future<Response> patchHttp(String route, body,
//       {Map<String, dynamic>? params,
//       bool formdata = false,
//       bool formEncoded = false,
//       bool authenticate = false}) {
//     // `TODO`: implement patchHttp
//     throw UnimplementedError();
//   }

//   @override
//   Future<Response> postHttp(String route, body,
//       {Map<String, dynamic>? params,
//       bool formdata = false,
//       bool formEncoded = false,
//       bool authenticate = false,
//       void Function({int count, int total})? onSendProgress,
//       void Function({int count, int total})? onRecieveProgress}) {
//     // `TODO`: implement postHttp
//     throw UnimplementedError();
//   }

//   @override
//   Future<Response> putHttp(String route, body,
//       {Map<String, dynamic>? params,
//       bool formdata = false,
//       bool formEncoded = false,
//       bool authenticate = false}) {
//     // `TODO`: implement putHttp
//     throw UnimplementedError();
//   }
// }
