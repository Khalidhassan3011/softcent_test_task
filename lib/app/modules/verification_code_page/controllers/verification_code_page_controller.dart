import 'dart:async';

import '../../../common/util/exports.dart';
import '../../../models/contact_number.dart';
import '../../../models/otp_code.dart';
import '../../../notification/my_notification.dart';
import '../abstract/verification_code_page_abstract.dart';

class VerificationCodePageController extends GetxController implements VerificationCodePageAbstract {
  final ApiHelper _apiHelper = Get.find();

  late ContactNumber number;

  late Timer _timer;

  // resent code after 120 second
  RxInt max = Constants.value.resendCode.obs;

  String _otp = "";

  @override
  void onInit() {
    super.onInit();

    MyNotification.init();

    number = Get.arguments[Constants.argumentsKeyword.number] as ContactNumber;
    _sendOtp();
    _timer = _startTimer;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    _timer.cancel();
  }

  @override
  void nextButtonClick() {
    if (_otp == "41100") {
      Get.offAllNamed(Routes.home);
    } else {
      Utils.showSnackbar("invalidOtp".tr);
    }
  }

  @override
  void onResendClick() {
    if (max.value == 0) {
      _sendOtp();
      max.value = Constants.value.resendCode;
      _timer = _startTimer;
    }
  }

  @override
  void otpEntered(String otp) {
    _otp = otp;
  }

  Timer get _startTimer =>
      Timer.periodic(const Duration(seconds: 1), (Timer timer) {
        if (max < 0) {
          timer.cancel();
          max.value = 0;
        } else {
          max = max - 1;
        }
      });

  Future<void> _sendOtp() async {
    await _apiHelper.getOTP().then((value) {
      if (value.isOk) {
        _showNotification(OtpCode.fromJson(value.body));
      } else {
        Utils.showSnackbar("Something Wrong. Please try again");
      }
    });
  }

  void _showNotification(OtpCode otpCode) {
    MyNotification.showNotification(
      id: Helper.randomNumberWithoutDuplicate(1, 1000).first,
      title: "Verification OTP",
      body: "Your OTP is ${otpCode.otpCode}",
    );
  }
}
