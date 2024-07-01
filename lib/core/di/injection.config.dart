// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:talker_flutter/talker_flutter.dart' as _i6;

import '../../data/data.dart' as _i8;
import '../../domain/usecase/home/car_change_usecase.dart' as _i3;
import '../../domain/usecase/home/home_usecase.dart' as _i10;
import '../../domain/usecase/home/image_buffer.dart' as _i5;
import '../../domain/usecase/home/search_usecase.dart' as _i4;
import '../../presentation/router/bloc.dart' as _i9;
import '../../presentation/ui/screens/home/bloc/bloc.dart' as _i11;
import '../../presentation/ui/screens/splash/bloc/bloc.dart' as _i12;
import 'injection.dart' as _i13;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.CarChangeUseCaseImpl>(() => _i3.CarChangeUseCaseImpl());
  gh.lazySingleton<_i4.SearchUseCaseImpl>(() => _i4.SearchUseCaseImpl());
  gh.lazySingleton<_i5.ImageBuffer>(() => _i5.ImageBuffer());
  gh.lazySingleton<_i6.Talker>(() => registerModule.talker);
  gh.lazySingleton<_i7.Dio>(() => registerModule.dio);
  gh.lazySingleton<_i8.AppConfigStorageRepository>(
      () => _i8.AppConfigStorageRepositoryImpl());
  gh.lazySingleton<_i9.RouterEventSink>(
      () => _i9.RouterBloc(gh<_i8.AppConfigStorageRepository>()));
  gh.factory<_i10.HomeUseCase>(() => _i10.HomeUseCaseImpl());
  gh.factory<_i11.HomeBloc>(() => _i11.HomeBloc(
        gh<_i9.RouterEventSink>(),
        gh<_i10.HomeUseCase>(),
        gh<_i4.SearchUseCaseImpl>(),
        gh<_i3.CarChangeUseCaseImpl>(),
      ));
  gh.factory<_i12.SplashBloc>(() => _i12.SplashBloc(
        gh<_i9.RouterEventSink>(),
        gh<_i6.Talker>(),
      ));
  return getIt;
}

class _$RegisterModule extends _i13.RegisterModule {}
