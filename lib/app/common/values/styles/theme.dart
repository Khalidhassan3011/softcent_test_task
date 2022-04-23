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
          primary: AppColors.colorPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.buttonRadius),
          ),
          minimumSize: Size(250, Dimens.buttonHeight),
          textStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: Dimens.fontSize14,
          ),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return AppColors.colorPrimary;
            }
            return AppColors.colorPrimary;
          },
        ),
      ),
    );
  }

  static ThemeData get dark {
    return light;
  }
}
