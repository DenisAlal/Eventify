part of presentation;

class BaseProfileIcon extends StatelessWidget {
  final double size;
  final double indicatorBorderWidth;
  final double indicatorPadding;

  const BaseProfileIcon({
    super.key,
    this.size = 64,
    this.indicatorBorderWidth = 3,
    this.indicatorPadding = 2,
  });

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Container(
            width: size,
            height: size,
            decoration: ShapeDecoration(
              color: AppColors.white,
              shape: const CircleBorder(),
              shadows: [
                BoxShadow(
                  color: AppColors.textFieldShadow.withOpacity(0.54),
                  offset: const Offset(0, 8),
                  blurRadius: 19,
                ),
              ],
            ),
            child: const Center(
              child: BaseTextIcon(
                icon: AppTextIcons.profile,
                color: AppColors.darkOrchid,
                fontSize: 24,
              ),
            ),
          ),
          Positioned(
            right: indicatorPadding,
            bottom: indicatorPadding,
            child: Container(
              width: size / 4 - indicatorBorderWidth * 2,
              height: size / 4 - indicatorBorderWidth * 2,
              decoration: ShapeDecoration(
                color: AppColors.green,
                shape: CircleBorder(
                  side: BorderSide(
                    width: indicatorBorderWidth,
                    color: AppColors.background,
                    strokeAlign: BorderSide.strokeAlignOutside,
                  ),
                ),
              ),
            ),
          )
        ],
      );
}
