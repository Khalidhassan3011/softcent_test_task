import 'package:get/get.dart';

import '../modules/home_page/bindings/home_page_binding.dart';
import '../modules/home_page/views/home_page_view.dart';
import '../modules/sign_up_page/bindings/sign_up_page_binding.dart';
import '../modules/sign_up_page/views/sign_up_page_view.dart';
import '../modules/transaction/bindings/transaction_binding.dart';
import '../modules/transaction/views/transaction_view.dart';
import '../modules/verification_code_page/bindings/verification_code_page_binding.dart';
import '../modules/verification_code_page/views/verification_code_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.transaction;

  static final routes = [
    GetPage(
      name: _Paths.signUp,
      page: () => SignUpPageView(),
      binding: SignUpPageBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.verificationCode,
      page: () => VerificationCodePageView(),
      binding: VerificationCodePageBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.home,
      page: () => HomePageView(),
      binding: HomePageBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.transaction,
      page: () => TransactionView(),
      binding: TransactionViewBinding(),
      transition: Transition.rightToLeft,
    ),
  ];
}
