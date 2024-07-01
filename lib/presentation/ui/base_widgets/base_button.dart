part of presentation;

class AppButton extends StatefulWidget {
  const AppButton({
    required this.data,
    Key? key,
  }) : super(key: key);

  final AppButtonData data;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> scaleAnimation;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    scaleAnimation = animationController.drive(Tween(begin: 1.0, end: 0.99));

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  onLongPress() async {
    if (widget.data.onLongPress != null) {
      if (animationController.isDismissed) {
        await animationController.forward();
      }

      HapticFeedback.heavyImpact();

      if (!animationController.isDismissed) {
        await animationController.reverse();
      }

      await widget.data.onLongPress!();
    }
  }

  onTap() async {
    if (widget.data.action != null) {
      if (animationController.isDismissed) {
        await animationController.forward();
      }

      HapticFeedback.lightImpact();

      if (!animationController.isDismissed) {
        await animationController.reverse();
      }

      await widget.data.action!();
    }
  }

  onTapDown(TapDownDetails details) async {
    if (widget.data.action != null) {
      if (animationController.isDismissed) {
        await animationController.forward();
      }
    }
  }

  onTapCancel() async {
    if (widget.data.action != null) {
      if (!animationController.isDismissed) {
        await animationController.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) => ScaleTransition(
        scale: scaleAnimation,
        child: Material(
          elevation: widget.data.showBackground
              ? widget.data.backgroundStyleData.elevation
              : 0,
          shadowColor: widget.data.backgroundStyleData.shadowColor,
          color: widget.data.showBackground
              ? widget.data.backgroundStyleData.backgroundColor
              : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                widget.data.backgroundStyleData.borderRadius),
            side: widget.data.showBorder &&
                    widget.data.backgroundStyleData.borderColor != null
                ? BorderSide(
                    color: widget.data.backgroundStyleData.borderColor!,
                    width: widget.data.backgroundStyleData.borderWidth,
                  )
                : BorderSide.none,
          ),
          child: InkWell(
            onTap: widget.data.action != null ? onTap : null,
            onLongPress: widget.data.onLongPress != null ? onLongPress : null,
            onTapDown: widget.data.action != null ? onTapDown : null,
            onTapCancel: widget.data.action != null ? onTapCancel : null,
            borderRadius: BorderRadius.circular(
                widget.data.backgroundStyleData.borderRadius),
            overlayColor: widget.data.backgroundStyleData.overlayColor != null
                ? MaterialStateProperty.all<Color>(
                    widget.data.backgroundStyleData.overlayColor!)
                : null,
            highlightColor: widget.data.backgroundStyleData.highlightColor,
            child: widget.data.content,
          ),
        ),
      );
}

enum AppButtonType {
  text,
  icon,
  iconAndText,
  navigationLink,
}

enum AppButtonForegroundStyle {
  black,
  white,
}

class AppButtonForegroundStyleData {
  final Color? labelColor;
  final Color? iconColor;

  const AppButtonForegroundStyleData({
    this.labelColor,
    this.iconColor,
  });

  factory AppButtonForegroundStyleData.of(AppButtonForegroundStyle style) {
    switch (style) {
      case AppButtonForegroundStyle.black:
        return const AppButtonForegroundStyleData(
          labelColor: Colors.black,
          iconColor: AppColors.black,
        );

      case AppButtonForegroundStyle.white:
        return const AppButtonForegroundStyleData(
          labelColor: Colors.white,
          iconColor: AppColors.white,
        );

      default:
        throw UnimplementedError("Unknown button style: $style");
    }
  }
}

enum AppButtonBackgroundStyle {
  teal,
  gray,
  green,
}

class AppButtonBackgroundStyleData {
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? shadowColor;
  final Color? overlayColor;
  final Color? highlightColor;
  final double borderWidth;
  final double borderRadius;
  final double elevation;

  const AppButtonBackgroundStyleData({
    this.backgroundColor,
    this.borderColor,
    this.shadowColor,
    this.overlayColor,
    this.highlightColor,
    this.borderWidth = 1.5,
    this.borderRadius = 0,
    this.elevation = 0,
  });

  factory AppButtonBackgroundStyleData.of(
    AppButtonBackgroundStyle style, {
    double? borderRadius,
    double? borderWidth,
    double? elevation,
  }) {
    switch (style) {
      case AppButtonBackgroundStyle.teal:
        return AppButtonBackgroundStyleData(
          backgroundColor: AppColors.teal,
          shadowColor: AppColors.teal.withOpacity(0.24),
          highlightColor: AppColors.teal.withOpacity(0.1),
          overlayColor: AppColors.teal.withOpacity(0.2),
          borderColor: AppColors.teal,
          borderRadius: borderRadius ?? 64,
          borderWidth: borderWidth ?? 1.5,
          elevation: elevation ?? 0,
        );

      case AppButtonBackgroundStyle.gray:
        return AppButtonBackgroundStyleData(
          backgroundColor: AppColors.gray6,
          shadowColor: AppColors.gray6.withOpacity(0.3),
          highlightColor: AppColors.black.withOpacity(0.1),
          overlayColor: AppColors.black.withOpacity(0.3),
          borderColor: AppColors.black,
          borderRadius: borderRadius ?? 64,
          borderWidth: borderWidth ?? 1.5,
          elevation: elevation ?? 0,
        );

      case AppButtonBackgroundStyle.green:
        return AppButtonBackgroundStyleData(
          backgroundColor: AppColors.green2,
          shadowColor: AppColors.green2.withOpacity(0.3),
          highlightColor: AppColors.white.withOpacity(0.1),
          overlayColor: AppColors.white.withOpacity(0.3),
          borderColor: AppColors.white,
          borderRadius: borderRadius ?? 64,
          borderWidth: borderWidth ?? 1.5,
          elevation: elevation ?? 0,
        );

      default:
        throw UnimplementedError("Unknown button style: $style");
    }
  }
}

class AppButtonData {
  AppButtonData({
    required this.content,
    required this.backgroundStyleData,
    this.action,
    this.onLongPress,
    this.showBackground = true,
    this.showBorder = false,
    Key? key,
  });

  final Widget content;
  late final AppButtonBackgroundStyleData backgroundStyleData;
  final Function()? action;
  final Function()? onLongPress;

  final bool showBackground;
  final bool showBorder;

  factory AppButtonData.of(
    AppButtonType type, {
    AppButtonBackgroundStyle? backgroundStyle,
    AppButtonForegroundStyle foregroundStyle = AppButtonForegroundStyle.black,
    String? label,
    String? icon,
    Function()? action,
    Function()? onLongPress,
    bool showBorder = false,
    double? borderRadius,
    double? elevation,
    int? iconQuarterTurns,
  }) {
    switch (type) {
      case AppButtonType.text:
        if (label?.isEmpty ?? true) {
          throw Exception(
            "Label is required for text button",
          );
        }

        if (backgroundStyle == null) {
          throw Exception(
            "Style is required for text button",
          );
        }

        final foregroundStyleData = AppButtonForegroundStyleData.of(
          foregroundStyle,
        );

        final backgroundStyleData = AppButtonBackgroundStyleData.of(
          backgroundStyle,
          borderRadius: borderRadius,
          elevation: elevation,
        );

        final content = Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          child: Text(
            label!,
            textAlign: TextAlign.center,
            style: AppTextStyles.mediumButtonLabel(
              color: foregroundStyleData.labelColor,
            ),
          ),
        );

        return AppButtonData(
          content: content,
          backgroundStyleData: backgroundStyleData,
          showBackground: true,
          showBorder: showBorder,
          action: action,
          onLongPress: onLongPress,
        );

      case AppButtonType.icon:
        if (icon?.isEmpty ?? true) {
          throw Exception(
            "Icon is required for icon button",
          );
        }

        if (backgroundStyle == null) {
          throw Exception(
            "Style is required for icon button",
          );
        }

        final foregroundStyleData = AppButtonForegroundStyleData.of(
          foregroundStyle,
        );

        final backgroundStyleData = AppButtonBackgroundStyleData.of(
          backgroundStyle,
          borderRadius: borderRadius,
          elevation: elevation,
        );

        final content = Padding(
          padding: const EdgeInsets.all(16),
          child: RotatedBox(
            quarterTurns: iconQuarterTurns ?? 0,
            child: AppAssetIcon(
              asset: icon!,
              height: 24,
              width: 24,
              color: foregroundStyleData.iconColor,
            ),
          ),
        );

        return AppButtonData(
          content: content,
          backgroundStyleData: backgroundStyleData,
          showBackground: true,
          showBorder: showBorder,
          action: action,
          onLongPress: onLongPress,
        );

      case AppButtonType.iconAndText:
        if (icon?.isEmpty ?? true) {
          throw Exception(
            "Icon is required for icon & text button",
          );
        }

        if (label?.isEmpty ?? true) {
          throw Exception(
            "Label is required for text button",
          );
        }

        if (backgroundStyle == null) {
          throw Exception(
            "Style is required for icon & text button",
          );
        }

        final foregroundStyleData = AppButtonForegroundStyleData.of(
          foregroundStyle,
        );

        final backgroundStyleData = AppButtonBackgroundStyleData.of(
          backgroundStyle,
          borderRadius: borderRadius,
          elevation: elevation,
        );

        final content = Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 2),
                child: RotatedBox(
                  quarterTurns: iconQuarterTurns ?? 0,
                  child: AppAssetIcon(
                    asset: icon!,
                    height: 16,
                    width: 16,
                    color: foregroundStyleData.iconColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2),
                child: Text(
                  label!,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.carCardButtonLabel(
                    color: foregroundStyleData.labelColor,
                  ),
                ),
              ),
            ],
          ),
        );

        return AppButtonData(
          content: content,
          backgroundStyleData: backgroundStyleData,
          showBackground: true,
          showBorder: showBorder,
          action: action,
          onLongPress: onLongPress,
        );

      case AppButtonType.navigationLink:
        if (label?.isEmpty ?? true) {
          throw Exception(
            "Label is required for list tile button",
          );
        }

        final backgroundStyleData = AppButtonBackgroundStyleData(
          backgroundColor: AppColors.white,
          highlightColor: AppColors.black.withOpacity(0.1),
          overlayColor: AppColors.black.withOpacity(0.3),
        );

        final content = Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  label!,
                  textAlign: TextAlign.start,
                  style: AppTextStyles.navigationLinkLabel(),
                ),
              ),
              if (icon != null)
                SizedBox(
                  width: 26,
                  height: 26,
                  child: Center(
                    child: RotatedBox(
                      quarterTurns: iconQuarterTurns ?? 0,
                      child: BaseTextIcon(
                        icon: icon,
                        fontSize: 15,
                        color: AppColors.lightGray2,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );

        return AppButtonData(
          content: content,
          backgroundStyleData: backgroundStyleData,
          showBackground: false,
          showBorder: showBorder,
          action: action,
          onLongPress: onLongPress,
        );
    }
  }
}
