part of presentation;

class BaseTextIcon extends StatelessWidget {
  final String icon;
  final Color? color;
  final Gradient? gradient;
  final double? fontSize;
  final FontWeight? fontWeight;

  const BaseTextIcon({
    super.key,
    required this.icon,
    this.color,
    this.gradient,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    if (gradient != null) {
      return GradientMask(
        gradient: gradient!,
        child: Text(
          icon,
          style: AppTextStyles.icons(
            color: color,
          ).copyWith(
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      );
    }

    return Text(
      icon,
      style: AppTextStyles.icons(
        color: color!,
      ).copyWith(
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
