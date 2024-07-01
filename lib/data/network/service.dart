import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_settings.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';

import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../core/core.dart';
import '../data.dart';

const _connectTimeoutMS = 1000000;
const _receiveTimeoutMS = 1000000;

class NetworkClient {
 // final AppInterceptor appInterceptor;
  final Talker talker;

  NetworkClient(
     // this.appInterceptor,
      this.talker);

  Dio create() {
    final talkerDioLogger = TalkerDioLogger(
      talker: talker,
      settings: const TalkerDioLoggerSettings(
        printRequestHeaders: CoreConstants.showRequestHeaders,
        printResponseHeaders: CoreConstants.showResponseHeaders,
        printRequestData: CoreConstants.showRequestData,
        printResponseData: CoreConstants.showFullResponseData,
      ),
    );

    final Dio client = Dio(
      BaseOptions(
        baseUrl: CoreConstants.baseUrl,
        connectTimeout: const Duration(milliseconds: _connectTimeoutMS),
        receiveTimeout: const Duration(milliseconds: _receiveTimeoutMS),
        sendTimeout: const Duration(milliseconds: _receiveTimeoutMS),
      ),
    );
    client.interceptors.clear();
    client.interceptors.addAll([
      //Request logger, to more detail add [logPrint: (m) => log(m.toString()),]
      if (!kReleaseMode)
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          // logPrint: (m) => log(m.toString()),
        ),
      //Interceptor for user token on request
      InterceptorsWrapper(onRequest: (options, handler) async {
        // await Future.delayed(const Duration(milliseconds: 500));
        //appInterceptor.onRequest(options, handler);
      }),
      InterceptorsWrapper(onError: (options, handler) async {
        await Future.delayed(const Duration(milliseconds: 500));
       // appInterceptor.onError(options, handler);
      }),
      talkerDioLogger,
    ]);

    return client;
  }
}

class TalkerClient {
  Talker create() {
    final talker = TalkerFlutter.init(
      settings: TalkerSettings(
        colors: {
          TalkerLogType.verbose: AnsiPen()..yellow(),
        },
      ),
    );
    talker.verbose('Talker initialization completed');
    Bloc.observer = TalkerBlocObserver(
      talker: talker,
      settings: const TalkerBlocLoggerSettings(
        printCreations: CoreConstants.blocPrintCreations,
        printClosings: CoreConstants.blocPrintClosings,
        printStateFullData: CoreConstants.blocPrintStateFullData,
      ),
    );
    return talker;
  }
}
