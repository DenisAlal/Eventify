import '../presentation.dart';
import '../ui/screen_components/bottom_sheet/delete_message.dart';
import '../ui/screens/home/bloc/models.dart';
import 'models.dart';

abstract class RouterEvent {}

class RouteInit implements RouterEvent {}

class RouteOnPop implements RouterEvent {}

// Errors

class RouteConnectionChange implements RouterEvent {
  final bool isError;

  RouteConnectionChange(this.isError);
}

class RouteShowError implements RouterEvent {
  final String? error;

  RouteShowError(this.error);
}

class RouteShowMessage implements RouterEvent {
  final String message;

  RouteShowMessage(this.message);
}

class RouteShowBlockError implements RouterEvent {}

//

class RouteOnOnboarding implements RouterEvent {}

class RouteOnAuth implements RouterEvent {}

class RouteOnRecognize implements RouterEvent {}

class RouteAfterRecognize implements RouterEvent {}

class RouteOnPhotoDetails implements RouterEvent {
  final List<dynamic> data;
  final int initIndex;

  RouteOnPhotoDetails(this.data, this.initIndex);
}

class RouteOnUserPreview implements RouterEvent {
  final UserUIModel data;

  RouteOnUserPreview(this.data);
}

class RouteOnUsersList implements RouterEvent {
  final List<UserUIModel> data;

  RouteOnUsersList(this.data);
}

class EndSplash implements RouterEvent {}

class EndOnboarding implements RouterEvent {}

class RouteOnHome implements RouterEvent {}

class RouteOnCar implements RouterEvent {
  final CarScreenModel? car;
  final String carNumber;

  RouteOnCar(this.car, this.carNumber);
}

// Bottom Sheet

class RouteOnLogoutBottomSheet implements RouterEvent {
  final Function() action;

  RouteOnLogoutBottomSheet(this.action);
}

class RouteOnExitBottomSheet implements RouterEvent {
  final Function() action;

  RouteOnExitBottomSheet(this.action);
}

class RouteOnDeleteBottomSheet implements RouterEvent {
  final Function() action;

  RouteOnDeleteBottomSheet(this.action);
}

class RouteOnDeleteMessageBottomSheet implements RouterEvent {
  final Function() action;
  final DeleteMessageType type;

  RouteOnDeleteMessageBottomSheet(this.action, this.type);
}

class RouteOnDeletePhotoBottomSheet implements RouterEvent {
  final Function() action;

  RouteOnDeletePhotoBottomSheet(this.action);
}

class RouteOnComplainBottomSheet implements RouterEvent {
  final Function() action;
  final String text;

  RouteOnComplainBottomSheet(this.action, this.text);
}

//

class SelectTabRouteEvent extends RouterEvent {
  final BasicScreenTypes screenType;

  SelectTabRouteEvent(this.screenType);
}

class ChangeChatCount extends RouterEvent {
  final int? count;

  ChangeChatCount(this.count);
}
