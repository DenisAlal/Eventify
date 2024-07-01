import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventify/presentation/router/router.dart';
import 'package:eventify/presentation/ui/screens/splash/bloc/bloc.dart';

import '../../core/di/injection.dart';
import '../presentation.dart';
import '../ui/screen_components/bottom_sheet/complain_view.dart';
import '../ui/screen_components/bottom_sheet/delete_message.dart';
import '../ui/screen_components/bottom_sheet/delete_view.dart';
import '../ui/screen_components/bottom_sheet/logout_view.dart';
import '../ui/screens/home/bloc/bloc.dart';
import 'models.dart';

class ScreenProvider {
  static RouteInfo splash() => RouteInfo(
        id: AppRoutes.splash,
        builder: (_) => BlocProvider(
          create: (context) => getIt<SplashBloc>()..add(const SplashEvent.init()),
          child: const SplashScreen(),
        ),
        screenType: null,
      );


  static RouteInfo home() => RouteInfo(
      id: AppRoutes.home,
      builder: (_) => BlocProvider(
            create: (context) => getIt<HomeBloc>(),
            child: const HomeScreen(),
          ),
      screenType: BasicScreenTypes.home);

  static RouteInfo events() => RouteInfo(
      id: AppRoutes.events,
      builder: (_) =>  const EventsScreen(),
      screenType: BasicScreenTypes.events);



  static RouteInfo importExport() => RouteInfo(
      id: AppRoutes.importExport,
      builder: (_) =>  const ImportExportScreen(),
      screenType: BasicScreenTypes.importExport);


  static RouteInfo deleteUser(Function() action) => RouteInfo(
        id: '${AppRoutes.delete}${Random().nextInt(10000)}',
        type: PageType.bottomSheet,
        builder: (_) => DeleteBottomSheet(action),
      );

  static RouteInfo deleteMessage(Function() action, DeleteMessageType type) => RouteInfo(
        id: '${AppRoutes.deleteMessage}${Random().nextInt(10000)}',
        type: PageType.bottomSheet,
        builder: (_) => DeleteMessageBottomSheet(action, type),
      );

  static RouteInfo logout(Function() action) => RouteInfo(
        id: '${AppRoutes.logout}${Random().nextInt(10000)}',
        type: PageType.bottomSheet,
        builder: (_) => LogoutBottomSheet(action),
      );


  static RouteInfo complain(Function() action, String text) => RouteInfo(
        id: '${AppRoutes.complain}${Random().nextInt(10000)}',
        type: PageType.bottomSheet,
        builder: (_) => ComplainBottomSheet(action, text),
      );
}
