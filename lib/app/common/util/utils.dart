import 'package:flutter/services.dart';

import 'exports.dart';

class Utils {
  const Utils._();

  static void loadingDialog() {
    Utils.closeDialog();

    Get.dialog(
      WillPopScope(
        onWillPop: () async => false,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      name: 'loadingDialog',
      barrierDismissible: false,
    );
  }

  static void closeDialog() {
    if (Get.isDialogOpen == true) {
      Get.back();
    }
  }

  static void closeSnackbar() {
    if (Get.isSnackbarOpen == true) {
      Get.back();
    }
  }

  static void showSnackbar(String? message) {
    closeSnackbar();

    Get.rawSnackbar(message: message);
  }

  static void closeKeyboard() {
    final currentFocus = Get.focusScope!;
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  static void goBackToScreen(String routeName) {
    Get.until((route) => route.settings.name == routeName);
  }

  static get exit => SystemChannels.platform.invokeMethod('SystemNavigator.pop');

  static get unFocus => FocusManager.instance.primaryFocus?.unfocus();

  static get exitApp => SystemChannels.platform.invokeMethod('SystemNavigator.pop');

  static Future<bool> appExitConfirmation() async {
    return _appExit() ?? false;
  }

  static dynamic _appExit() {
    Get.defaultDialog(
        title: 'Exit App?',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("exitAppHints".tr),
            SizedBox(height: 20.h),
            Row(
              children: [
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text("NO"),
                ),
                TextButton(
                  onPressed: () {
                    Utils.closeKeyboard();
                    unFocus;
                    exitApp;
                  },
                  child: const Text("YES"),
                ),
              ],
            ),
          ],
        ),
        radius: 10.0,
        contentPadding: const EdgeInsets.only(top: 30),
      titlePadding: const EdgeInsets.only(top: 20),
    );
  }
}
