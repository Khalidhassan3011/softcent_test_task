import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../common/util/exports.dart';
import '../../../common/widgets/my_appbar.dart';
import '../../../common/widgets/my_appbar_icon.dart';
import '../controllers/verification_code_page_controller.dart';

class VerificationCodePageView extends GetView<VerificationCodePageController> {
  const VerificationCodePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // appbar
          MyAppBar(icon: MyAppbarIcon.close),

          _image,

          SizedBox(height: 15.h),

          _title,

          SizedBox(height: 7.h),

          _hints,

          SizedBox(height: 14.h),

          _number,

          SizedBox(height: 35.h),

          _pinCode,

          SizedBox(height: 30.h),

          _resend,

          SizedBox(height: 27.h),

          // next button
          _nextButton,

        ],
      ),
    );
  }

  Widget get _image => Container(
    height: 298.h,
    width: 298.h,
    child: Image.asset(AppAssets.image.otp),
  );

  Widget get _title => Center(
    child: Text(
      "verificationCode".tr,
      style: GoogleFonts.dmSans(
        fontWeight: FontWeight.w500,
        fontSize: Dimens.fontSize32,
      ),
    ),
  );

  Widget get _hints => Center(
    child: Text(
      "codeTypeHints".tr,
      style: Style.textStyle.hints.copyWith(
        fontSize: Dimens.fontSize16,
      ),
    ),
  );
  Widget get _number => Center(
    child: Text(
      Helper.formatNumberAsCountryCode(controller.number),
      style: GoogleFonts.lato(
        fontSize: Dimens.fontSize16,
        fontWeight: FontWeight.w400,
        color: AppColors.colorTextGrey,
      ),
    ),
  );
  Widget get _pinCode => Container(
    margin: EdgeInsets.symmetric(
      horizontal: Dimens.marginH + 9,
    ),
    child: PinCodeTextField(
      appContext: Get.context!,
      length: 5,
      obscureText: false,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      keyboardType: TextInputType.number,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(6),
        fieldHeight: 54,
        fieldWidth: 50,
        borderWidth: 0,
        inactiveColor: AppColors.colorOtpFieldBg,
        inactiveFillColor: AppColors.colorOtpFieldBg,
        activeFillColor: AppColors.colorOtpFieldBg,
        activeColor: AppColors.colorOtpFieldBg,
        selectedColor: AppColors.colorOtpFieldBg,
        selectedFillColor: AppColors.colorOtpFieldBg,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
      autoDismissKeyboard: true,
      cursorColor: AppColors.colorPrimary,
      onCompleted: controller.otpEntered,
      onChanged: (value) {
        print(value);
      },
      beforeTextPaste: (text) {
        print("Allowing to paste $text");
        return true;
      },
      textStyle: Style.textStyle.hints.copyWith(
        fontSize: Dimens.fontSize22,
        color: AppColors.colorTextGrey,
      ),
    ),
  );

  Widget get _resend => Container(
        margin: EdgeInsets.symmetric(
          horizontal: Dimens.marginH,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "resendHints".tr,
              style: Style.textStyle.resend,
            ),
            Obx(
              () => GestureDetector(
                onTap: controller.onResendClick,
                child: Text(
                  controller.max.value > 0
                      ? Helper.secondToMinute(controller.max.value)
                      : "resend".tr,
                  style: Style.textStyle.resend.copyWith(
                    color: AppColors.colorPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget get _nextButton => Container(
    margin: EdgeInsets.symmetric(
      horizontal: Dimens.marginH + 9,
    ),
    child: ElevatedButton(
      onPressed: controller.nextButtonClick,
      child: Text("next".tr),
    ),
  );
}
