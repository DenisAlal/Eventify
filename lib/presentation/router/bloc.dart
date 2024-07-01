import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eventify/presentation/router/provider.dart';
import 'package:eventify/presentation/router/states.dart';
import 'package:collection/collection.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

import '../../data/data.dart';
import '../presentation.dart';
import 'events.dart';
import 'models.dart';
import 'router.dart';

abstract class RouterEventSink {
  void add(RouterEvent event);
}

@LazySingleton(as: RouterEventSink)
class RouterBloc extends Bloc<RouterEvent, RouterState>
    implements RouterEventSink {
  final AppConfigStorageRepository appConfigStorageRepository;

  StreamSubscription? userWatcher;
  StreamSubscription? banWatcher;
  bool haveUser = false;

  StreamSubscription? internetSubscription;

  int? messageCount;

  RouterBloc( this.appConfigStorageRepository)
      : super(RouterState(routerInfo: [])) {
    on<RouteInit>(_onInit);
    on<RouteShowError>(_onShowError);
    on<RouteShowMessage>(_onShowMessage);
    on<SelectTabRouteEvent>(_selectTab);
    on<RouteOnHome>(_onHome);
    on<EndSplash>(_endSplash);
    on<EndOnboarding>(_endOnboarding);
    on<RouteOnDeleteMessageBottomSheet>(_onDeleteMessageSheet);
    on<RouteOnPop>(_onPop);
    add(RouteInit());

    internetSubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result != ConnectivityResult.mobile &&
          result != ConnectivityResult.wifi) {
        add(RouteConnectionChange(true));
      } else {
        add(RouteConnectionChange(false));
      }
    });


  }

  List<RouteInfo> get stack => state.routerInfo.toList();
  BasicScreenTypes? currentScreenType;

  _onInit(RouteInit event, Emitter<RouterState> emit) async {
    emit(state.copyWith(routerInfo: [ScreenProvider.splash()]));
  }

  _endSplash(EndSplash event, Emitter<RouterState> emit) async {
    add(RouteOnHome());
  }

  _endOnboarding(EndOnboarding event, Emitter<RouterState> emit) async {
    await appConfigStorageRepository.setOnboardingStatus();
    add(RouteOnHome());
  }

  _onPop(RouteOnPop event, Emitter<RouterState> emit) {
    final List<RouteInfo> newStack = [];
    for (var element in stack) {
      newStack.add(element);
    }
    var last = stack.lastOrNull;
    newStack.removeLast();
    if (last?.screenType != null) {
      var newLast = newStack
          .lastWhereOrNull((element) => element.screenType == last!.screenType);
      if (newLast != null) {
        newStack.remove(newLast);
        emit(state.copyWith(routerInfo: [...newStack, newLast]));
      } else {
        emit(state.copyWith(
            routerInfo: newStack.isNotEmpty ? newStack : newStack));
      }
    } else {
      emit(state.copyWith(
          routerInfo: newStack.isNotEmpty ? newStack : newStack));
    }
  }



  _onShowError(RouteShowError event, Emitter<RouterState> emit) async {
    if (state.headerData?.$2 == event.error) {
      return;
    } else if (event.error != null) {
      emit(
          state.copyWith(headerData: (AppHeaderModalType.error, event.error!)));
    } else {
      emit(state.copyWith(headerData: null));
    }
  }

  _onShowMessage(RouteShowMessage event, Emitter<RouterState> emit) async {
    if (state.headerData?.$2 == event.message) {
      return;
    } else {
      emit(state
          .copyWith(headerData: (AppHeaderModalType.message, event.message)));
    }
  }



  Future<void> _selectTab(SelectTabRouteEvent event, Emitter<RouterState> emit) async {
    var lastCurrentStack = stack.lastWhereOrNull((element) => element.screenType == event.screenType);
    currentScreenType = event.screenType;
    if (lastCurrentStack != null) {
      List<RouteInfo> copyStack = [...stack];
      copyStack.remove(lastCurrentStack);
      emit(state.copyWith(routerInfo: [...copyStack, lastCurrentStack], chatCount: messageCount));
    } else {
      switch (event.screenType) {
        case BasicScreenTypes.home:
          emit(state.copyWith(routerInfo: [...stack, ScreenProvider.home()], chatCount: messageCount));
          break;
        case BasicScreenTypes.events:
          emit(state.copyWith(routerInfo: [...stack, ScreenProvider.events()], chatCount: messageCount));
          break;
        default:
          emit(state.copyWith(routerInfo: [...stack, ScreenProvider.importExport()], chatCount: messageCount));
          break;
      }
    }
  }

  _onHome(RouteOnHome event, Emitter<RouterState> emit) async {
    emit(state.copyWith(routerInfo: [...stack, ScreenProvider.home()]));
  }



  _onDeleteMessageSheet(
      RouteOnDeleteMessageBottomSheet event, Emitter<RouterState> emit) {
    emit(state.copyWith(routerInfo: [
      ...stack,
      ScreenProvider.deleteMessage(event.action, event.type)
    ]));
  }


  @override
  Future<void> close() {
    userWatcher?.cancel();
    banWatcher?.cancel();
    internetSubscription?.cancel();
    return super.close();
  }
}
