part of presentation;

class AppAssetIcon extends StatelessWidget {
  final String asset;
  final Color? color;
  final double? width;
  final double? height;

  const AppAssetIcon({
    super.key,
    required this.asset,
    this.color,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    if (asset.contains(".svg")) {
      return SvgPicture.asset(
        asset,
        width: width,
        height: height,
        colorFilter: ColorFilter.mode(
          color ?? AppColors.black,
          BlendMode.srcIn,
        ),
      );
    }

    return Image.asset(
      asset,
      width: width,
      height: height,
      color: color,
    );
  }
}
