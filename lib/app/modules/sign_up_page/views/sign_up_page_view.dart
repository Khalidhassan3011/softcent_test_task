import 'package:softcent_test_task/app/common/widgets/my_appbar.dart';
import 'package:softcent_test_task/app/common/widgets/my_appbar_icon.dart';
import 'package:softcent_test_task/app/common/widgets/my_keyboard.dart';

import '../../../common/util/exports.dart';
import '../controllers/sign_up_page_controller.dart';

class SignUpPageView extends GetView<SignUpPageController> {
  const SignUpPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: Utils.appExitConfirmation,
      child: Scaffold(
        body: Stack(
          children: [
            ListView(
              children: [
                // appbar
                MyAppBar(
                  icon: MyAppbarIcon.arrowLeft,
                  onBackPressed: Utils.appExitConfirmation,
                ),

                SizedBox(height: 57.h),

                // title
                _appName,

                SizedBox(height: 40.h),

                // phone
                _phone,

                SizedBox(height: 38.h),

                // terms
                _terms,

                SizedBox(height: 18.h),

                // continue button
                _continueButton,

                SizedBox(height: 22.h),

                // sign in hints
                _signInHints,
              ],
            ),

            // keyboard
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: MyKeyboard(
                onChange: controller.onKeypadNumberPressed,
                onClear: controller.onKeypadClearPressed,
                height: Dimens.keyboardHeight - 100,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _appName => Center(
        child: Text(
          "appName".tr,
          style: Style.textStyle.appTitle,
        ),
      );

  Widget get _phone => Container(
        margin: EdgeInsets.symmetric(
          horizontal: Dimens.marginH,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // phone hints
            _phoneHints,

            SizedBox(height: 15.h),

            Row(
              children: [
                _countryCode,
                SizedBox(width: 12.w),
                _number,
              ],
            ),
          ],
        ),
      );

  Widget get _phoneHints => Text(
        "phoneNumber".tr,
        textAlign: TextAlign.left,
        style: Style.textStyle.hints,
      );

  Widget get _countryCode => GestureDetector(
        onTap: () {
          _selectCountryCode();
        },
        child: Container(
          width: 97.w,
          height: Dimens.inputHeight,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            color: AppColors.colorTextFieldBg,
            borderRadius: BorderRadius.circular(Dimens.inputRadius),
            border: Border.all(color: AppColors.colorBorderInput),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
                () => Text(
                  controller.number.value.numberFormat.countryCode,
                  style: Style.textStyle.hints,
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 20,
              ),
            ],
          ),
        ),
      );

  Widget get _number => Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          height: Dimens.inputHeight,
          decoration: BoxDecoration(
            color: AppColors.colorTextFieldBg,
            borderRadius: BorderRadius.circular(Dimens.inputRadius),
            border: Border.all(color: AppColors.colorBorderInput),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Obx(
              () => Text(
                controller.number.value.number,
                style: Style.textStyle.hints,
              ),
            ),
          ),
        ),
      );

  Widget get _terms => Container(
        margin: EdgeInsets.symmetric(
          horizontal: Dimens.marginH,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // check box
            Transform.scale(
              scale: .8,
              child: Obx(
                () => Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                  ),
                  value: controller.termsAgreed.value,
                  onChanged: (value) {
                    controller.onTermsAndConditionClick();
                  },
                ),
              ),
            ),

            // hints

            Text(
              "youAgree".tr,
              style: Style.textStyle.hints.copyWith(
                fontWeight: FontWeight.w500,
                letterSpacing: -.3,
              ),
            ),

            Text(
              "termsAndConditions".tr,
              style: Style.textStyle.hints.copyWith(
                fontWeight: FontWeight.w500,
                letterSpacing: -.3,
                color: AppColors.colorPrimary,
              ),
            ),
          ],
        ),
      );

  Widget get _continueButton => Container(
        margin: EdgeInsets.symmetric(
          horizontal: Dimens.marginH,
        ),
        child: ElevatedButton(
          onPressed: controller.onContinuePressed,
          child: Text("continue".tr),
        ),
      );

  Widget get _signInHints => Container(
        margin: EdgeInsets.symmetric(
          horizontal: Dimens.marginH,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "signUpHints".tr,
              style: Style.textStyle.hints.copyWith(
                fontWeight: FontWeight.w500,
                letterSpacing: -.3,
              ),
            ),
            Text(
              "signUp".tr,
              style: Style.textStyle.hints.copyWith(
                fontWeight: FontWeight.w500,
                letterSpacing: -.3,
                color: AppColors.colorPrimary,
              ),
            ),
          ],
        ),
      );

  void _selectCountryCode() {
    List<Widget> _items = [];

    for (var numberFormat in Helper.data.numberFormat) {
      _items.add(InkWell(
        onTap: () => controller.onCountryCodeSelect(numberFormat),
        child: ListTile(
          leading: Text(
            numberFormat.countryCode,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              letterSpacing: .5,
            ),
          ),
          trailing: Text(
            numberFormat.numberFormat.demoNumber(),
            style: Style.textStyle.hints.copyWith(
              wordSpacing: 4,
            ),
          ),
        ),
      ));
    }

    Get.bottomSheet(
      Card(
        child: Container(
          height: 300,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ListView(
            children: _items,
          ),
        ),
      ),
      barrierColor: Colors.transparent,
      isDismissible: true,
      enableDrag: true,
    );
  }
}
