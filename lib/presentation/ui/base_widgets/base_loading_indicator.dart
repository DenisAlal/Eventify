part of presentation;

class BaseLoadingIndicator extends StatelessWidget {

  final double? height;
  final double? width;
  final Color? color;

  const BaseLoadingIndicator({
    Key? key, this.height, this.width, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return SizedBox(
        height: height ?? double.infinity,
        width: width ?? double.infinity,
        child: const Center(
          child: CircularProgressIndicator(
            color: AppColors.darkOrchid,
            backgroundColor: AppColors.whiteWithOpacity,
          ),
        ),
      );
  }
}
