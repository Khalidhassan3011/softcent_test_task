import 'package:softcent_test_task/app/common/util/exports.dart';

class MyAppbarIcon {
  static Widget get arrowLeft => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 5),
          _icon(Icons.arrow_back_ios, 16),
        ],
      );

  static Widget get close => _icon(Icons.close);

  static Widget _icon(IconData iconData, [double size = 14]) => Icon(
        iconData,
        color: Colors.black,
        size: size,
      );
}
