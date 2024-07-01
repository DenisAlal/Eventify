library home_bloc;

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/core.dart';
import '../../../../../domain/usecase/home/car_change_usecase.dart';
import '../../../../../domain/usecase/home/home_usecase.dart';
import '../../../../../domain/usecase/home/search_usecase.dart';
import '../../../../presentation.dart';
import '../../../../router/bloc.dart';
import '../../../../router/events.dart';
import 'models.dart';

part 'bloc.freezed.dart';

part 'event.dart';

part 'state.dart';

@Injectable()
class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  final HomeUseCase homeUseCase;
  final SearchUseCaseImpl searchDelegate;
  final CarChangeUseCaseImpl carDelegate;
  List<CarScreenModel> _cars = [];

  final RouterEventSink _routerEventSink;

  String searchValue = '';
  StreamSubscription? userWatcher;
  StreamSubscription? searchWatcher;
  StreamSubscription? carWatcher;
  bool haveUser = false;

  HomeBloc(this._routerEventSink, this.homeUseCase, this.searchDelegate, this.carDelegate)
      : super(HomeState(state: HomeScreenState.data, isLoading: false, haveUser: false, cars: [], searchString: null)) {
    on<_InitEvent>(_init);
    add(const _InitEvent());

  }

  @override
  Future<void> close() {
    userWatcher?.cancel();
    searchWatcher?.cancel();
    carWatcher?.cancel();
    return super.close();
  }

  Future<void> _init(
    _InitEvent event,
    Emitter<HomeState> emit,
  ) async {

    emit(state.copyWith(cars: _cars, isLoading: false, haveUser: haveUser, searchString: null));
  }
}
