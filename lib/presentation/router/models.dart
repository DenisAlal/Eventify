import 'package:flutter/cupertino.dart';

enum BasicScreenTypes {
  home,
  events,
  importExport;

  static BasicScreenTypes indexToType(int index) {
    if (index == 0) {
      return BasicScreenTypes.home;
    }
    if(index == 1) {
      return BasicScreenTypes.events;
    }
    return BasicScreenTypes.importExport;
  }
}

class BasicScreenModel {
  final BasicScreenTypes type;
  final Widget screen;

  BasicScreenModel({required this.type, required this.screen});

  BasicScreenModel copyWith({
    BasicScreenTypes? type,
    Widget? screen,
  }) =>
      BasicScreenModel(
        type: type ?? this.type,
        screen: screen ?? this.screen,
      );
}
