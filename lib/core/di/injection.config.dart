// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:http/http.dart' as _i519;
import 'package:injectable/injectable.dart' as _i526;
import 'package:temp_project/core/di/network_module.dart' as _i437;
import 'package:temp_project/core/network/dio/dio_factory.dart' as _i241;
import 'package:temp_project/core/network/http/http_service.dart' as _i86;
import 'package:temp_project/core/storage/token_storage.dart' as _i657;
import 'package:temp_project/features/auth/data/datasource/remote/auth_api_service.dart'
    as _i552;
import 'package:temp_project/features/auth/data/repositories/auth_repository_impl.dart'
    as _i320;
import 'package:temp_project/features/auth/domain/repositories/auth_repository.dart'
    as _i859;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i519.Client>(() => networkModule.client);
    gh.lazySingleton<_i558.FlutterSecureStorage>(() => networkModule.storage);
    gh.lazySingleton<_i86.HttpService>(
      () => _i86.HttpService(
        client: gh<_i519.Client>(),
        defaultTimeout: gh<Duration>(),
      ),
    );
    gh.lazySingleton<_i657.TokenStorage>(
      () => _i657.TokenStorage(storage: gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i241.DioFactory>(
      () => networkModule.dioFactory(gh<_i657.TokenStorage>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.dio(gh<_i241.DioFactory>()),
    );
    gh.lazySingleton<_i552.AuthApiService>(
      () => networkModule.authApiService(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i859.AuthRepository>(
      () => _i320.AuthRepositoryImpl(gh<_i552.AuthApiService>()),
    );
    return this;
  }
}

class _$NetworkModule extends _i437.NetworkModule {}
