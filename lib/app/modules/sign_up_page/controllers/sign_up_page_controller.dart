import 'package:softcent_test_task/app/common/util/exports.dart';

import '../../../models/contact_number.dart';
import '../../../models/number_format.dart';
import '../abstract/sign_up_page_abstract.dart';

class SignUpPageController extends GetxController implements SignUpPageAbstract {

  RxBool termsAgreed = true.obs;

  Rx<ContactNumber> number = ContactNumber(Helper.data.numberFormat.first, "").obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  @override
  void onContinuePressed() {
    if (Helper.isValidNumberLength(number.value)) {
      Utils.showSnackbar("invalidNumber".tr);
    } else if (!termsAgreed.value) {
      Utils.showSnackbar("termsRequest".tr);
    } else {
      Get.toNamed(Routes.verificationCode, arguments: {
        Constants.argumentsKeyword.number: number.value,
      });
    }
  }

  @override
  void onKeypadClearPressed() {
    number.value.number = "";
    number.refresh();
  }

  @override
  void onKeypadNumberPressed(String value) {
    if (Helper.isValidNumberLength(number.value)) {
      number.value.number += value;
      number.refresh();
    }
  }

  @override
  void onTermsAndConditionClick() {
    termsAgreed.value = !termsAgreed.value;
  }

  @override
  void onCountryCodeSelect(NumberFormat numberFormat) {
    Get.back();
    number.value.numberFormat = numberFormat;
    number.refresh();
  }
}
