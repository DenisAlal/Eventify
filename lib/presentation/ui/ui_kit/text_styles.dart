part of presentation;

abstract class AppTextStyles {
  static appBarAction({Color? color}) => TextStyle(
        fontSize: 16,
        height: 22 / 16,
        letterSpacing: -0.32,
        color: color ?? AppColors.white,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.normal,
      );

  static displaySmall({Color? color}) => TextStyle(
        fontFamily: "Proxima Nova",
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 22 / 16,
        letterSpacing: -0.4,
        color: color ?? AppColors.white,
      );

  static headerSmall({Color? color}) => TextStyle(
        fontSize: 13,
        height: 22 / 13,
        color: color ?? AppColors.white,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.normal,
      );

  static homePageTitle({Color? color}) => TextStyle(
        fontSize: 16,
        height: 21 / 16,
        letterSpacing: -0.32,
        color: color ?? AppColors.white,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w600,
      );

  static homePageSubtitle({Color? color}) => TextStyle(
        fontSize: 14,
        height: 20 / 14,
        color: color ?? AppColors.white,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.normal,
      );

  static displayMedium({Color? color}) => TextStyle(
        fontSize: 22,
        height: 28 / 22,
        letterSpacing: 0.35,
        color: color ?? AppColors.white,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w700,
      );

  static displayLarge({Color? color}) => TextStyle(
        fontSize: 28,
        height: 25 / 20,
        color: color ?? AppColors.white,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w500,
      );

  static bodyLarge({Color? color}) => TextStyle(
        fontSize: 20,
        height: 25 / 20,
        color: color ?? AppColors.white,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w700,
      );

  static bodyMedium({Color? color}) => TextStyle(
        fontSize: 17,
        height: 22 / 17,
        color: color ?? AppColors.white,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.normal,
      );

  static bodySmall({Color? color}) => TextStyle(
        fontSize: 13,
        height: 18 / 13,
        letterSpacing: -0.08,
        color: color ?? AppColors.white,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.normal,
      );

  static navigationLinkLabel({Color? color}) => TextStyle(
        fontSize: 15,
        height: 22 / 15,
        letterSpacing: -0.41,
        color: color ?? AppColors.white,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.normal,
      );

  static dialogAction({Color? color}) => TextStyle(
        fontSize: 17,
        height: 22 / 17,
        letterSpacing: -0.41,
        color: color ?? AppColors.white,
        fontFamily: 'Proxima Nova',
        fontWeight: FontWeight.normal,
      );

  static dialogActionSelected({Color? color}) => TextStyle(
        fontSize: 18,
        height: 25 / 18,
        letterSpacing: 0.32,
        color: color ?? AppColors.white,
        fontFamily: 'Proxima Nova',
        fontWeight: FontWeight.w600,
      );

  static dialogTitle({Color? color}) => TextStyle(
        fontSize: 17,
        height: 22 / 17,
        letterSpacing: -0.41,
        color: color ?? AppColors.white,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w600,
      );

  static actionSheetAction({Color? color}) => TextStyle(
        fontSize: 17,
        height: 22 / 17,
        letterSpacing: -0.41,
        color: color ?? AppColors.white,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.normal,
      );

  static actionSheetActionSelected({Color? color}) => TextStyle(
        fontSize: 17,
        height: 22 / 17,
        letterSpacing: -0.41,
        color: color ?? AppColors.white,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.bold,
      );

  static appBarTitle({Color? color}) => TextStyle(
        fontSize: 16,
        height: 22 / 16,
        letterSpacing: -0.41,
        color: color ?? AppColors.white,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w500,
      );

  static userName({Color? color}) => TextStyle(
        fontSize: 16,
        height: 25 / 16,
        color: color ?? AppColors.white,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w600,
      );

  static icons({Color? color}) => TextStyle(
        fontSize: 15,
        height: 22 / 15,
        color: color ?? AppColors.white,
        fontFamily: 'SF Pro Text',
        fontWeight: FontWeight.normal,
      );

  static regularButtonLabel({Color? color}) => TextStyle(
        fontSize: 16,
        height: 22 / 16,
        color: color ?? AppColors.white,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.normal,
      );

  static mediumButtonLabel({Color? color}) => TextStyle(
        fontSize: 16,
        height: 1.2,
        color: color ?? AppColors.white,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w500,
      );

  static smallButtonLabel({Color? color}) => TextStyle(
        fontSize: 13,
        height: 18 / 13,
        color: color ?? AppColors.white,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.normal,
      );

  static textfieldLabel({Color? color}) => TextStyle(
        fontSize: 13,
        height: 18 / 13,
        color: color ?? AppColors.white,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w600,
      );

  static textfieldDescription({Color? color}) => TextStyle(
        fontSize: 13,
        height: 18 / 13,
        color: color ?? AppColors.white,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.normal,
      );

  static appIcon({Color? color}) => TextStyle(
        fontSize: 36,
        color: color ?? AppColors.white,
        fontFamily: 'Outfit',
        fontWeight: FontWeight.w500,
      );

  static appIconLabel({Color? color}) => TextStyle(
        fontSize: 18,
        height: 25 / 18,
        color: color ?? AppColors.white,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w500,
      );

  static body1({Color? color}) => TextStyle(
        fontSize: 14,
        color: color ?? AppColors.white,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.bold,
      );

  static body2({Color? color}) => TextStyle(
        fontSize: 12,
        color: color ?? AppColors.white,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.normal,
      );

  static header({Color? color}) => TextStyle(
        fontSize: 20,
        color: color ?? AppColors.white,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w500,
      );

  static newsCardLabel({Color? color}) => TextStyle(
        fontSize: 12,
        color: color ?? AppColors.white,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w500,
      );

  static carCardButtonLabel({Color? color}) => TextStyle(
        fontSize: 10,
        color: color ?? AppColors.white,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w500,
      );

  static onboardingPageTitle({Color? color}) => TextStyle(
        fontSize: 26,
        height: 1.2,
        color: color ?? AppColors.white,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w500,
      );

  static onboardingPageText({Color? color}) => TextStyle(
        fontSize: 18,
        height: 1.2,
        color: color ?? AppColors.white,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.normal,
      );

  static SF18700({Color? color}) => TextStyle(
        fontSize: 18,
        color: color ?? AppColors.white,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w700,
      );
}
