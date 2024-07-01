part of presentation;

class AppBottomDialog extends StatelessWidget {
  final String? title;
  final String? assetImage;
  final String? message;
  final bool showCancelButton;
  final List<AppDialogAction> actions;

  const AppBottomDialog({
    Key? key,
    this.title,
    this.assetImage,
    this.message,
    this.showCancelButton = true,
    this.actions = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final hasTitle = title != null && title!.isNotEmpty;
    // final hasMessage = message != null && message!.isNotEmpty;

    // if (Platform.isIOS || Platform.isMacOS) {
    return CupertinoActionSheet(
      title: title != null ? Text(title!) : null,
      message: message != null ? Text(message!) : null,
      actionScrollController: ScrollController(),
      actions: [
        ...[
          for (final action in actions)
            CupertinoActionSheetAction(
              onPressed: () {
                action.action?.call();

                Navigator.of(context).pop();
              },
              child: Text(action.label),
            ),
        ],
      ],
      cancelButton: CupertinoActionSheetAction(
        isDefaultAction: true,
        onPressed: Navigator.of(context).pop,
        child: const Text("Отмена"),
      ),
    );
  }
}

class AppDialogAction {
  final String label;
  final Function()? action;
  final bool closeDialogOnAction;
  final TextStyle labelTextStyle;
  final Color highlightColor;
  final Color splashColor;

  const AppDialogAction({
    required this.label,
    required this.labelTextStyle,
    this.action,
    this.closeDialogOnAction = true,
    this.highlightColor = AppColors.darkOrchid,
    this.splashColor = AppColors.darkOrchid,
  });

  CupertinoActionSheetAction toCupertinoActionSheetAction() =>
      CupertinoActionSheetAction(
        onPressed: () => action?.call(),
        child: Text(label),
      );
}

