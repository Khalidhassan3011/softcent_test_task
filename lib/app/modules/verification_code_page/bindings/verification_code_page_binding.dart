import 'package:get/get.dart';

import '../controllers/verification_code_page_controller.dart';

class VerificationCodePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerificationCodePageController>(
      () => VerificationCodePageController(),
    );
  }
}
