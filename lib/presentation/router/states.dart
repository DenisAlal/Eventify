import 'package:eventify/presentation/router/router.dart';

class RouterState {
  final Iterable<RouteInfo> routerInfo;

  final (AppHeaderModalType type, String data)? headerData;

  final int? chatCount;

  RouterState({required this.routerInfo, this.headerData, this.chatCount});

  RouterState copyWith({
    Iterable<RouteInfo>? routerInfo,
    (AppHeaderModalType type, String data)? headerData,
    int? chatCount,
  }) =>
      RouterState(
        routerInfo: routerInfo ?? this.routerInfo,
        headerData: headerData,
        chatCount: chatCount,
      );

  @override
  bool operator ==(Object other) {
    if (other is RouterState) {
      // print(routerInfo == other.routerInfo);
      // print(headerData == other.headerData);
    }
    return identical(this, other) ||
      other is RouterState &&
          runtimeType == other.runtimeType &&
          routerInfo == other.routerInfo &&
          headerData == other.headerData &&
          chatCount == other.chatCount;
  }

  @override
  int get hashCode => routerInfo.hashCode ^ headerData.hashCode ^ chatCount.hashCode;
}
