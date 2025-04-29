import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_api_firestore/src/common/common.dart';

/// {@template dio_client_item}
/// The dio client for authenticated users
/// {@endtemplate}
@dev
@LazySingleton()
class DioClient {
  /// {@macro dio_client_item}
  DioClient() {
    _dio.options = BaseOptions(
      receiveTimeout: const Duration(seconds: Values.requestDuration),
      connectTimeout: const Duration(seconds: Values.requestDuration),
      sendTimeout: const Duration(seconds: Values.requestDuration),
    );

    _dio.interceptors.addAll(
      {
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            // Add authorization header

            // final tokenModel = await httpClientLocator<ITokenStorage>().read();
            // if (tokenModel != Token.empty) {
            //   options.headers['Authorization'] = 'Bearer ${tokenModel.token}';
            // }
            options.headers['Authorization'] = 'Bearer ${Values.tmdbToken}';
            return handler.next(options);
          },
          onResponse: (response, handler) {
            // Handle successful responses
            return handler.next(response);
          },
          onError: (DioException error, handler) {
            // Handle errors
            _handleError(error);
            return handler.next(error);
          },
        ),
        DioCacheInterceptor(
          options: CacheOptions(
            store: MemCacheStore(maxEntrySize: 1000000, maxSize: 5000000),
            maxStale: const Duration(days: 30),
            priority: CachePriority.high,
          ),
        ),
        LogInterceptor(),
      },
    );
  }
  final Dio _dio = Dio();

  ///returns the dio instance.
  Dio get client => _dio;

  void _handleError(DioException error) {
    if (error.type == DioExceptionType.connectionTimeout) {
    } else if (error.type == DioExceptionType.sendTimeout) {
    } else if (error.type == DioExceptionType.receiveTimeout) {
    } else if (error.type == DioExceptionType.badResponse) {
    } else if (error.type == DioExceptionType.cancel) {
    } else if (error.type == DioExceptionType.unknown) {}

    // Display error in the UI

    // Optionally, use a Snackbar, Dialog, or Toast to show the error to the
    // user
  }
}
