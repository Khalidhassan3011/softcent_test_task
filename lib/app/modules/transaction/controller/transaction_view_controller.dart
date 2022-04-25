import 'package:softcent_test_task/app/common/util/exports.dart';

import '../../../models/transaction_model.dart';

class TransactionViewController extends GetxController {
  final ApiHelper _apiHelper = Get.find();

  RxBool loading = false.obs;

  TransactionModel? transactionModel;

  @override
  void onInit() {
    super.onInit();

    _getTransactions();
  }

  Future<void> _getTransactions() async {
    loading.value = true;
    await _apiHelper.getTransaction().then((value) {
      if(value.isOk) {
        transactionModel = TransactionModel.fromJson(value.body);
      }
    });
    loading.value = false;
  }
}
