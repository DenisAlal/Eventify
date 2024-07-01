import 'package:eventify/presentation/router/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:eventify/presentation/presentation.dart';
import 'package:eventify/presentation/router/router.dart';
import 'package:provider/provider.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'core/di/injection.dart';
import 'data/data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting("ru-RU");
  tz.initializeTimeZones();
  await setupHive();
  configureInjection();
  runApp(const MyApp());
}

Future<void> setupHive() async {
  await Hive.initFlutter();
  await AppConfigStorageRepositoryImpl.init();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Provider<UserDataService>(
        //   lazy: false,
        //   create: (_) => getIt<UserDataService>(),
        // ),
        BlocProvider<RouterBloc>(
          create: (_) => getIt<RouterEventSink>() as RouterBloc,
        ),
      ],
      child: MaterialApp(
        title: 'NomerApp',
        supportedLocales: const [
          Locale('ru', 'RU'),
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightTheme,
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(boldText: false, textScaleFactor: 1),
          child: child!,
        ),
        home: Router(
          routerDelegate: AppRouterDelegate(),
          backButtonDispatcher: RootBackButtonDispatcher(),
        ),
      ),
    );
  }
}


