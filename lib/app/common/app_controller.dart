import 'util/exports.dart';

class AppController extends GetxController {
  final globalKey = GlobalKey<NavigatorState>();

  RxString selectedLanguage = "".obs;

  @override
  void onInit() {
    super.onInit();

    selectedLanguage.value = StorageHelper.getLanguage;
  }
}
