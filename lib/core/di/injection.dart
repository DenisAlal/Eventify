import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';
import '../../data/data.dart';
import '../../data/network/service.dart';
import '../../presentation/presentation.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: false,
)
FutureOr<GetIt> configureInjection() => init(getIt);

@module
abstract class RegisterModule {
  @lazySingleton
  Talker get talker => TalkerClient().create();

  @lazySingleton
  Dio get dio => NetworkClient(
      //_appInterceptor,
      talker).create();

  // @lazySingleton
  // AppInterceptor get _appInterceptor {
  //   return AppInterceptor(getIt<UserStorageRepository>(), talker);
  // }
}
