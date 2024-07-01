library splash_bloc;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../../../../core/core.dart';
import '../../../../presentation.dart';
import '../../../../router/bloc.dart';
import '../../../../router/events.dart';

part 'bloc.freezed.dart';

part 'event.dart';

part 'state.dart';

@Injectable()
class SplashBloc extends BaseBloc<SplashEvent, SplashState> {
  final RouterEventSink _routerEventSink;
  final Talker talker;
  SplashBloc(this._routerEventSink, this.talker) : super(const SplashState.init()) {
    on<InitEvent>(_init);
    on<DoneEvent>(_done);
  }

  Future<void> _init(InitEvent event, Emitter emit) async {
  }

  Future<void> _done(DoneEvent event, Emitter emit) async {
    _routerEventSink.add(EndSplash());
  }
}
