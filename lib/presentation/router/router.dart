import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:eventify/presentation/router/states.dart';

import '../../core/core.dart';
import '../../resources/constants.dart';
import '../presentation.dart';
import 'bloc.dart';
import 'events.dart';
import 'models.dart';

class AppRouterDelegate extends RouterDelegate<RouteInfo>
    with PopNavigatorRouterDelegateMixin<RouteInfo>, ChangeNotifier {
  int selectIndex = 0;

  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RouterBloc, RouterState>(

      listener: (context, state) async {
        if (state.routerInfo.last.screenType?.index != null) {
          selectIndex = state.routerInfo.last.screenType!.index;
        }
      },
      buildWhen: (previous, current) {
        print(previous != current);
        return previous != current;
      },
      builder: (context, state) {
        if (state.routerInfo.isEmpty) return Container();
        final pages = <NavigationPage>[];
        for (var page in state.routerInfo) {
          pages.add(
            NavigationPage(
              id: page.id,
              type: page.type,
              key: ValueKey(page.id),
              child: page.builder(context),
              color: page.color,
            ),
          );
        }
        return Stack(
          children: [
            Navigator(
              key: navigatorKey,
              pages: pages,
              reportsRouteUpdateToEngine: true,
              onPopPage: (route, result) {
                if (!route.didPop(result)) return false;

                if (route.settings.name != null) {
                  context.read<RouterBloc>().add(RouteOnPop());
                }
                return true;
              },
            ),
            if (pages.last.type == PageType.screen)
              OrientationBuilder(
                builder: (context, orientation) {
                  return Align(
                      alignment: Alignment.bottomCenter,
                      child: SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            if (!isShow(pages.last.name) &&
                                orientation != Orientation.landscape)
                              AnimatedTabBar(
                                tabs: BasicScreenTypes.values.map((e) {
                                  return (
                                    type: e,
                                    isActive: selectIndex == e.index
                                  );
                                }).toList(),
                                selectedIndex: selectIndex,
                                chatCount: state.chatCount,
                              ),
                          ],
                        ),
                      ));
                },
              ),
            if (state.headerData != null)
              AppHeaderModal(state.headerData!.$1, state.headerData!.$2, () {
                context.read<RouterBloc>().add(RouteShowError(null));
              })
            // AppHeaderModal()
          ],
        );
      },
    );
  }

  @override
  Future<void> setNewRoutePath(RouteInfo configuration) async {}

  bool isShow(String? name) {
    if (name != null &&
        (name.contains(AppRoutes.splash) ||
            name.contains(AppRoutes.onboarding) ||
            name.contains(AppRoutes.authorization) ||
            name.contains(AppRoutes.photoDetail) ||
            name.contains(AppRoutes.recognize))) {
      return true;
    }
    return false;
  }

  Future<T?> showTopModalSheet<T>(
    BuildContext context,
    Widget child, {
    bool barrierDismissible = true,
    BorderRadiusGeometry? borderRadius,
  }) {
    return showGeneralDialog<T?>(
      context: context,
      barrierDismissible: barrierDismissible,
      transitionDuration: const Duration(milliseconds: 250),
      barrierLabel: MaterialLocalizations.of(context).dialogLabel,
      barrierColor: Colors.black.withOpacity(0.5),
      pageBuilder: (context, _, __) => child,
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position:
              CurvedAnimation(parent: animation, curve: Curves.easeOutCubic)
                  .drive(Tween<Offset>(
                      begin: const Offset(0, -1.0), end: Offset.zero)),
          child: Column(
            children: [
              Material(
                borderRadius: borderRadius,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [child],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class NavigationPage<T> extends Page<T> {
  const NavigationPage({
    required this.child,
    required this.type,
    required String id,
    required ValueKey key,
    this.color,
  }) : super(key: key, name: id);

  /// The content to be shown in the [Route] created by this page.
  final Widget child;
  final PageType type;
  final Color? color;

  @override
  Route<T> createRoute(BuildContext context) {
    var routeChild = child;
    switch (type) {
      case PageType.screen:
        return MaterialPageRoute<T>(
          settings: this,
          builder: (_) => routeChild,
        );
      case PageType.dialog:
        return DialogRoute<T>(
          context: context,
          settings: this,
          builder: (_) => routeChild,
        );
      case PageType.bottomSheet:
        final navigator = Navigator.of(context, rootNavigator: false);
        return ModalBottomSheetRoute(
          builder: (_) => routeChild,
          capturedThemes:
              InheritedTheme.capture(from: context, to: navigator.context),
          isScrollControlled: true,
          settings: this,
          backgroundColor: color ?? AppColors.blackBrown,
          showDragHandle: true,
          elevation: 0,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          )),
        );
    }
  }
}

class RouteInfo {
  RouteInfo({
    required this.id,
    this.screenType,
    this.type = PageType.screen,
    required this.builder,
    this.color,
  });

  final String id;
  final WidgetBuilder builder;
  final Color? color;
  final BasicScreenTypes? screenType;
  PageType type;

  @override
  String toString() {
    return 'Route{id: $id, builder: $builder}';
  }
}

enum PageType {
  screen,
  dialog,
  bottomSheet,
}

class AnimatedTabBar extends StatefulWidget {
  final List<({BasicScreenTypes type, bool isActive})> tabs;

  final int selectedIndex;

  final int? chatCount;

  const AnimatedTabBar(
      {super.key,
      required this.tabs,
      required this.selectedIndex,
      this.chatCount});

  @override
  State<AnimatedTabBar> createState() => _AnimatedTabBar();
}

class _AnimatedTabBar extends State<AnimatedTabBar> {
  final animationDuration = const Duration(milliseconds: 300);
  final animationCurve = Curves.easeInOut;

  final tabHeight = 65.0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 15, left: 15),
            child: Container(
              height: tabHeight,
              decoration: BoxDecoration(
                  color: AppColors.blackBrown,
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Stack(
                  children: [
                    AnimatedAlign(
                      duration: animationDuration,
                      curve: animationCurve,
                      alignment: FractionalOffset(
                          1 / (widget.tabs.length - 1) * widget.selectedIndex,
                          0),
                      child: Container(
                        height: tabHeight,
                        color: Colors.transparent,
                        child: FractionallySizedBox(
                          widthFactor: 1 / widget.tabs.length,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 40.0),
                              child: Container(
                                height: 5,
                                width: 25,
                                decoration: BoxDecoration(
                                    color: AppColors.darkOrchid,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                        children: widget.tabs.asMap().entries.map((entry) {
                      return Expanded(
                        child: GestureDetector(
                          onTap: () {
                            if (entry.key == widget.selectedIndex) return;
                            FocusScope.of(context).unfocus();
                            context.read<RouterBloc>().add(SelectTabRouteEvent(
                                BasicScreenTypes.indexToType(entry.key)));
                          },
                          child: Container(
                            color: Colors.transparent,
                            height: tabHeight,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                screenIconBuilder(entry.value.type,
                                    entry.value.isActive, widget.chatCount),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList()),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget screenIconBuilder(
      BasicScreenTypes type, bool isActive, int? chatCount) {
    final ColorFilter colorFilter = ColorFilter.mode(
        isActive ? AppColors.white : AppColors.whiteWithOpacity,
        BlendMode.srcIn);
    switch (type) {
      case BasicScreenTypes.home:
        return SvgPicture.asset(
          AppAssets.home,
          width: 24,
          height: 24,
          colorFilter: colorFilter,
        );
      case BasicScreenTypes.events:
        return SvgPicture.asset(
          AppAssets.wallet,
          width: 24,
          height: 24,
          colorFilter: colorFilter,
        );
      case BasicScreenTypes.importExport:
        return SvgPicture.asset(
          AppAssets.wallet,
          width: 24,
          height: 24,
          colorFilter: colorFilter,
        );
    }
  }
}

enum AppHeaderModalType { error, message, connection }

class AppHeaderModal extends StatefulWidget {
  final AppHeaderModalType type;
  final String data;
  final Function() popAction;

  const AppHeaderModal(this.type, this.data, this.popAction, {super.key});

  @override
  State<AppHeaderModal> createState() => _AppHeaderModalState();
}

class _AppHeaderModalState extends State<AppHeaderModal> {
  Timer? countdownTimer;
  Duration myDuration = const Duration(seconds: 5);

  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    setState(() {
      final seconds = myDuration.inSeconds - 1;
      if (seconds < 0) {
        countdownTimer!.cancel();
        widget.popAction();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 128,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  color: (widget.type == AppHeaderModalType.error ||
                          widget.type == AppHeaderModalType.connection)
                      ? AppColors.red
                      : AppColors.white,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  // child: DefaultTextStyle(
                  //   style: AppTextStyles.mediumButtonLabel(color: AppColors.white),
                  //   child: widget.data.contains('Ваш аккаунт временно заблокирован.')
                  //       ? RichText(
                  //           textAlign: TextAlign.center,
                  //           text: TextSpan(
                  //               text: 'Ваш аккаунт временно заблокирован.\nПожалуйста, обратитесь ',
                  //               children: [
                  //                 TextSpan(
                  //                   text: 'в поддержку',
                  //                   style: const TextStyle(
                  //                     fontSize: 14,
                  //                     height: 20 / 14,
                  //                     color: AppColors.white,
                  //                     fontFamily: 'SF Pro Display',
                  //                     fontWeight: FontWeight.normal,
                  //                     decoration: TextDecoration.underline,
                  //                   ),
                  //                   recognizer: TapGestureRecognizer()
                  //                     ..onTap = () async {
                  //                       bool canLaunch = await URLLauncher.canLaunchUrl(CoreConstants.cite);
                  //                       if (canLaunch) {
                  //                         await URLLauncher.launchUrl(CoreConstants.cite);
                  //                       }
                  //                     },
                  //                 ),
                  //               ],
                  //               style: AppTextStyles.regularButtonLabel(color: AppColors.white)),
                  //         )
                  //       : Text(
                  //           widget.data,
                  //           textAlign: TextAlign.center,
                  //           style: AppTextStyles.regularButtonLabel(
                  //               color: (widget.type == AppHeaderModalType.error ||
                  //                       widget.type == AppHeaderModalType.connection)
                  //                   ? AppColors.white
                  //                   : AppColors.black),
                  //         ),
                  // ),
                ),
              ),
            ],
          ),
        ));
  }
}
