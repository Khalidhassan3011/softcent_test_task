part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const signUp = _Paths.signUp;
  static const verificationCode = _Paths.verificationCode;
  static const home = _Paths.home;
  static const transaction = _Paths.transaction;
}

abstract class _Paths {
  _Paths._();
  static const signUp = '/sign-up-page';
  static const verificationCode = '/verification-code-page';
  static const home = '/home-page';
  static const transaction = '/transaction';
}
