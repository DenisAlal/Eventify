part of presentation;

class CustomBehavior extends ScrollBehavior {
  const CustomBehavior();

  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) =>
      child;
}
