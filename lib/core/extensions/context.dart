part of core;

extension BuildContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  Size get screenSize => MediaQuery.of(this).size;

  EdgeInsets get padding => MediaQuery.of(this).padding;


  double widthByPercent(double percent) {
    assert(percent >= 0 && percent <= 100);

    return (screenSize.width * percent) / 100;
  }

  double heightByPercent(double percent) {
    assert(percent >= 0 && percent <= 100);

    return (screenSize.height * percent) / 100;
  }
}

extension DoubleExtension on double {
  adaptive(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    double scale = 1.0;

    if (height > 1200) {
      scale = 1200 / 900;
    } else {
      scale = height / 800;
    }

    return scale * toDouble().abs();
  }
}
