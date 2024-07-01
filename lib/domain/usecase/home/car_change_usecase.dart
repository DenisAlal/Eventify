import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../../presentation/presentation.dart';
import '../../../presentation/ui/screens/home/bloc/models.dart';

@LazySingleton()
class CarChangeUseCaseImpl {
  final _carController = BehaviorSubject<CarScreenModel>();

  Stream<CarScreenModel> get carController => _carController.stream;

  StreamSink<CarScreenModel> get carSink => _carController.sink;
}