import 'package:softcent_test_task/app/models/number_format.dart';

abstract class SignUpPageAbstract {
  void onKeypadNumberPressed(String value);

  void onKeypadClearPressed();

  void onContinuePressed();

  void onTermsAndConditionClick();

  void onCountryCodeSelect(NumberFormat numberFormat);
}
