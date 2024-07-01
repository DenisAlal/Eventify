import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../../presentation/presentation.dart';

@LazySingleton()
class SearchUseCaseImpl {
  final _searchController = BehaviorSubject<String>();

  Stream<String> get searchController => _searchController.stream;

  StreamSink<String> get searchSink => _searchController.sink;
}
