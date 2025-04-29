// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:movie_app_api_firestore/src/common/common.dart' as _i244;
import 'package:movie_app_api_firestore/src/common/dio_client/api.dart'
    as _i954;
import 'package:movie_app_api_firestore/src/common/dio_client/api_un_authenticated.dart'
    as _i433;
import 'package:movie_app_api_firestore/src/common/http_client/http_client_impl.dart'
    as _i135;

const String _dev = 'dev';

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt testInit({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i433.DioClientNoAuth>(
      () => _i433.DioClientNoAuth(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i954.DioClient>(
      () => _i954.DioClient(),
      registerFor: {_dev},
    );
    gh.factory<_i244.IHttpClient>(
      () => _i135.HttpClient(
        api: gh<_i244.DioClient>(),
        apiNoAuth: gh<_i244.DioClientNoAuth>(),
      ),
      registerFor: {_dev},
    );
    return this;
  }
}
