// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:flutter_template/config/dependency_injection/modules/network_module.dart'
    as _i7;
import 'package:flutter_template/features/auth/application/login/login_cubit.dart'
    as _i3;
import 'package:flutter_template/features/shared/infrastructure/url_launcher_service.dart'
    as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt $registerDependencies({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.factory<_i3.LoginCubit>(() => _i3.LoginCubit());
    gh.lazySingleton<_i4.PrettyDioLogger>(() => networkModule.prettyLogger);
    gh.factory<String>(
      () => networkModule.baseHttpUrl,
      instanceName: 'BaseUrl',
    );
    gh.factory<_i5.UrlLauncherService>(() => _i5.UrlLauncherServiceImpl());
    gh.lazySingleton<_i6.BaseOptions>(() =>
        networkModule.dioBaseOptions(gh<String>(instanceName: 'BaseUrl')));
    gh.lazySingleton<_i6.Dio>(() => networkModule.dio(
          gh<_i6.BaseOptions>(),
          gh<_i4.PrettyDioLogger>(),
        ));
    return this;
  }
}

class _$NetworkModule extends _i7.NetworkModule {}
