part of presentation;

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final String? appBarTitle;
  final bool automaticallyImplyLeading;
  final bool appBarCenterTitle;
  final bool buildAppBar;
  final bool topSafe;
  final bool bottomSafe;
  final bool expandBody;
  final bool resizeToAvoidBottomInset;
  final Color? backgroundColor;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Widget? action;

  // final PreferredSizeWidget? appBar;
  final Widget? bottomSheet;
  final bool? emptyTop;
  final bool extendBodyBehindAppBar;
  final Color? appBarColor;

  const BaseScaffold({
    Key? key,
    required this.body,
    this.appBarColor,
    this.emptyTop,
    this.appBarTitle,
    this.action,
    this.automaticallyImplyLeading = true,
    this.appBarCenterTitle = false,
    this.buildAppBar = true,
    this.topSafe = false,
    this.bottomSafe = false,
    this.resizeToAvoidBottomInset = true,
    this.backgroundColor,
    this.floatingActionButton,
    this.bottomNavigationBar,
    // this.appBar,
    this.expandBody = false,
    this.bottomSheet,
    this.extendBodyBehindAppBar = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: topSafe,
      bottom: false,
      child: GestureDetector(
        //TODO: Добавить unfocus в extentions
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          extendBody: expandBody,
          extendBodyBehindAppBar: extendBodyBehindAppBar,
          bottomSheet: bottomSheet,
          floatingActionButton: floatingActionButton,
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          backgroundColor: backgroundColor,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          appBar: (emptyTop == true
                  ? AppBar(
                      toolbarHeight: 0,
                      backgroundColor:
                          appBarColor ?? context.theme.scaffoldBackgroundColor,
                    )
                  : null),
          body: SafeArea(
            top: topSafe,
            bottom: bottomSafe,
            child: ScrollConfiguration(
              behavior: const CustomBehavior(),
              child: body,
            ),
          ),
          bottomNavigationBar: bottomNavigationBar,
        ),
      ),
    );
  }
}
