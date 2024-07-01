part of presentation;

class AppThemes {
  static get lightTheme => ThemeData(
      fontFamily: 'SF Pro Display',
      disabledColor: AppColors.disable,
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: AppColors.whiteWithDeepOpacity,
        cursorColor: AppColors.white,
        selectionHandleColor: AppColors.white,
      ),
      appBarTheme: const AppBarTheme(
          color: AppColors.white,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
          )),
      scaffoldBackgroundColor: AppColors.white,
      buttonTheme: const ButtonThemeData(
        buttonColor: AppColors.blackBrown,
      ),
      colorScheme: const ColorScheme.light(
        background: AppColors.white,
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: AppTextStyles.appIconLabel(color: AppColors.notAccent),
        hintStyle: AppTextStyles.appIconLabel(color: AppColors.white),
      ));
}

