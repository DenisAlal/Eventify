part of presentation;

class BaseAddFileButton extends StatefulWidget {
  final String label;
  final Function()? onTap;
  final bool enabled;
  final bool hasError;

  const BaseAddFileButton({
    super.key,
    required this.label,
    this.onTap,
    this.enabled = true,
    this.hasError = false,
  });

  @override
  State<BaseAddFileButton> createState() => _BaseAddFileButtonState();
}

class _BaseAddFileButtonState extends State<BaseAddFileButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> scaleAnimation;

  bool isActive = false;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    scaleAnimation = animationController.drive(Tween(begin: 1.0, end: 0.99));

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  onTap() async {
    if (!widget.enabled || widget.onTap == null) {
      return;
    }

    if (animationController.isDismissed) {
      await animationController.forward();
    }

    HapticFeedback.lightImpact();

    setState(() {
      isActive = true;
    });

    if (!animationController.isDismissed) {
      await animationController.reverse();
    }

    await widget.onTap!.call();

    setState(() {
      isActive = false;
    });
  }

  onTapDown(TapDownDetails details) async {
    if (animationController.isDismissed) {
      await animationController.forward();

      setState(() {
        isActive = true;
      });
    }
  }

  onTapCancel() async {
    if (!animationController.isDismissed) {
      await animationController.reverse();

      setState(() {
        isActive = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) => AnimatedSize(
        duration: const Duration(seconds: 2),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: ScaleTransition(
            scale: scaleAnimation,
            child: Material(
                type: MaterialType.canvas,
                color: widget.hasError
                    ? AppColors.darkOrchid.withOpacity(0.02)
                    : widget.enabled
                        ? AppColors.darkOrchid.withOpacity(0.02)
                        : AppColors.darkOrchid.withOpacity(0.02),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: InkWell(
                  onTap: onTap,
                  onTapDown: onTapDown,
                  onTapCancel: onTapCancel,
                  highlightColor: AppColors.darkOrchid.withOpacity(0.1),
                  splashColor: AppColors.darkOrchid.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BaseTextIcon(
                            icon: AppTextIcons.add,
                            fontSize: 20,
                            color: widget.hasError
                                ? AppColors.darkOrchid
                                : widget.enabled
                                    ? AppColors.darkOrchid
                                    : AppColors.darkOrchid,
                          ),
                          Text(
                            widget.label,
                            style: AppTextStyles.bodySmall(
                              color: widget.hasError
                                  ? AppColors.darkOrchid
                                  : widget.enabled
                                      ? AppColors.darkOrchid
                                      : AppColors.darkOrchid,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

      );
}
