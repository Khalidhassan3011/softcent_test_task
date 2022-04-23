import '../../util/exports.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get light {
    return ThemeData(
      primaryColor: AppColors.colorPrimary,
      scaffoldBackgroundColor: AppColors.colorBg,
      cardColor: Colors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.buttonRadius),
          ),
          minimumSize: Size(250, Dimens.buttonHeight),
        ),
      ),
    );
  }

  static ThemeData get dark {
    return light;
  }
}