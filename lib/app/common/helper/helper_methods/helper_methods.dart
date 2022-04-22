part of "../helper.dart";

class _HelperMethods {
  void changeLanguage(String language) {
    StorageHelper.setLanguage = language;
    Get.find<AppController>().selectedLanguage.value = language;
    Get.updateLocale(Locale(language));
  }
}
