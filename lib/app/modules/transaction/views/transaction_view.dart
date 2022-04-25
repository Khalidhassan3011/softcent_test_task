import 'package:softcent_test_task/app/models/transaction_model.dart';

import '../../../common/util/exports.dart';
import '../controller/transaction_view_controller.dart';

class TransactionView extends GetView<TransactionViewController> {
  const TransactionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Card",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          _addButton,
        ],
      ),
      body: ListView(
        children: [
          _card,
          _recentTransaction,
          Obx(() => controller.loading.value
              ? const Center(child: CircularProgressIndicator())
              : _allTransactionItems()),
        ],
      ),
    );
  }

  Widget _allTransactionItems() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: controller.transactionModel!.data.transactions.length,
      itemBuilder: (context, index) {
        Transaction t = controller.transactionModel!.data.transactions[index];
        return _transactionDetails(t);
      },
    );
  }

  Widget get _addButton => Container(
        margin: EdgeInsets.symmetric(horizontal: Dimens.marginH),
        height: 34,
        width: 34,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.colorCircleButton,
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      );

  Widget get _card => Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        height: 205,
        width: 331,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.colorCircleButton,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Regular Card",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            const Spacer(),
            const Center(
              child: Text(
                "3567 0070 0003 3256 2022",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Softcent",
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
                Text(
                  "Payback",
                  style: TextStyle(color: Colors.white, fontSize: 21),
                ),
              ],
            )
          ],
        ),
      );

  Widget get _recentTransaction => Container(
      margin: const EdgeInsets.all(16),
      child: const Text(
        "Recent Transaction",
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ));

  Widget _transactionDetails(Transaction transaction) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 16),
      child: Column(
        children: [
          Row(
            children: [
              _image,
              const SizedBox(width: 11),
              Expanded(child: _details(transaction)),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: Divider(
                height: 1,
                color: Colors.grey.withOpacity(.5),
              )),
        ],
      ),
    );
  }

  Widget get _image => Container(
        height: 32,
        width: 32,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.colorPrimary,
        ),
      );

  Widget _details(Transaction transaction) {
    return Column(
      children: [
        //
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              transaction.shopName,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              transaction.timestamp,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ],
        ),

        const SizedBox(
          height: 10,
        ),

        //
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Trans ID : ${transaction.transactionId}",
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
            ),
            Text(
              "- ৳ ${transaction.amountSend}",
              style: const TextStyle(
                color: Colors.red,
                fontSize: 16,
              ),
            ),
          ],
        ),

        const SizedBox(
          height: 10,
        ),

        //
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.calculate_sharp,
                  size: 16,
                ),
                const SizedBox(width: 6),
                Text(transaction.paymentType),
              ],
            ),
            Text(
              "+ ৳ ${transaction.amountRecieved}",
              style: const TextStyle(
                color: Colors.green,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
