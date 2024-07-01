part of presentation;

enum BaseIconBackgroundStyle {
  whiteWithGreenShadows,
  whiteWithVioletShadows,
  violet,
  whiteWithPurpleShadows,
  whiteWithBlueShadows,
  whiteWithRedShadows,
}

class BaseIconBackground extends StatelessWidget {
  final BaseIconBackgroundStyle? style;
  final double size;
  final double backgroundOpacity;
  final Offset primaryOffset;
  final double primaryBlur;
  final double primaryOpacity;
  final Offset secondaryOffset;
  final double secondaryBlur;
  final double secondaryOpacity;
  final Widget? child;

  const BaseIconBackground({
    super.key,
    this.style,
    required this.size,
    required this.backgroundOpacity,
    required this.primaryOffset,
    required this.primaryBlur,
    required this.primaryOpacity,
    required this.secondaryOffset,
    required this.secondaryBlur,
    required this.secondaryOpacity,
    this.child,
  });

  factory BaseIconBackground.smallest({
    BaseIconBackgroundStyle? style,
    Widget? child,
  }) =>
      BaseIconBackground(
        style: style,
        size: 56.0,
        backgroundOpacity: 0.68,
        primaryOffset: const Offset(-16, 16),
        primaryBlur: 20.0,
        primaryOpacity: 0.24,
        secondaryOffset: const Offset(8, -8),
        secondaryBlur: 40.0,
        secondaryOpacity: 0.24,
        child: child,
      );

  factory BaseIconBackground.small({
    BaseIconBackgroundStyle? style,
    Widget? child,
  }) =>
      BaseIconBackground(
        style: style,
        size: 64.0,
        backgroundOpacity: 0.68,
        primaryOffset: const Offset(-16, 16),
        primaryBlur: 20.0,
        primaryOpacity: 0.24,
        secondaryOffset: const Offset(8, -8),
        secondaryBlur: 40.0,
        secondaryOpacity: 0.24,
        child: child,
      );

  factory BaseIconBackground.medium({
    BaseIconBackgroundStyle? style,
    Widget? child,
  }) =>
      BaseIconBackground(
        style: style,
        size: 96.0,
        backgroundOpacity: 0.68,
        primaryOffset: const Offset(-16, 16),
        primaryBlur: 20.0,
        primaryOpacity: 0.24,
        secondaryOffset: const Offset(8, -8),
        secondaryBlur: 40.0,
        secondaryOpacity: 0.24,
        child: child,
      );

  factory BaseIconBackground.large({
    BaseIconBackgroundStyle? style,
    Widget? child,
  }) =>
      BaseIconBackground(
        style: style,
        size: 150.0,
        backgroundOpacity: 0.72,
        primaryOffset: const Offset(0, -32),
        primaryBlur: 48.0,
        primaryOpacity: 0.24,
        secondaryOffset: const Offset(-24, 32),
        secondaryBlur: 48.0,
        secondaryOpacity: 0.24,
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    if (style == null) {
      return SizedBox(
        height: size,
        width: size,
        child: Center(
          child: child,
        ),
      );
    }

    Color? backgroundColor;
    Gradient? backgroundGradient;
    Color? primaryColor;
    Color? secondaryColor;

    switch (style) {
      case BaseIconBackgroundStyle.whiteWithGreenShadows:
        backgroundColor = Colors.white.withOpacity(backgroundOpacity);
        primaryColor = const Color(0xFF3FD0BF);
        secondaryColor = const Color(0xFF53CBFF);
        break;
      case BaseIconBackgroundStyle.whiteWithVioletShadows:
        backgroundColor = Colors.white.withOpacity(backgroundOpacity);
        primaryColor = const Color(0xFF4729FF);
        secondaryColor = const Color(0xFFFAB5EB);
        break;
      case BaseIconBackgroundStyle.violet:
        backgroundGradient = AppGradients.violet;
        primaryColor = const Color(0xFF4729FF);
        secondaryColor = const Color(0xFFFAB5EB);
        break;
      case BaseIconBackgroundStyle.whiteWithPurpleShadows:
        backgroundColor = Colors.white.withOpacity(backgroundOpacity);
        primaryColor = const Color(0xFF8D1BFF);
        secondaryColor = const Color(0xFFFAB5EB);
        break;
      case BaseIconBackgroundStyle.whiteWithBlueShadows:
        backgroundColor = Colors.white.withOpacity(backgroundOpacity);
        primaryColor = const Color(0xFF2958FF);
        secondaryColor = const Color(0xFF7A4AFF);
        break;
      case BaseIconBackgroundStyle.whiteWithRedShadows:
        backgroundColor = Colors.white.withOpacity(backgroundOpacity);
        primaryColor = const Color(0xFFFF2257);
        secondaryColor = const Color(0xFFFF9153);
        break;
      default:
        break;
    }

    return SizedBox(
      height: size,
      width: size,
      child: Container(
        decoration: ShapeDecoration(
          shape: const CircleBorder(),
          color: backgroundColor,
          gradient: backgroundGradient,
          shadows: [
            if (primaryColor != null)
              BoxShadow(
                offset: primaryOffset,
                blurRadius: primaryBlur,
                color: primaryColor.withOpacity(primaryOpacity),
              ),
            if (secondaryColor != null)
              BoxShadow(
                offset: secondaryOffset,
                blurRadius: secondaryBlur,
                color: secondaryColor.withOpacity(secondaryOpacity),
              ),
          ],
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
