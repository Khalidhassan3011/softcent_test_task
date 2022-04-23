import 'dart:math';

import 'package:flutter/services.dart';
import 'package:softcent_test_task/app/models/contact_number.dart';
import '../../models/number_format.dart';
import '../util/exports.dart';

part 'helper_data/helper_data.dart';

part 'helper_methods/helper_methods.dart';

class Helper {
  static _HelperData get data => _HelperData();

  static _HelperMethods get methods => _HelperMethods();

  static void copyToClipboard(String data) {
    Clipboard.setData(ClipboardData(text: data));
  }

  static List<int> randomNumberWithoutDuplicate(int totalNumber, int max) {
    List<int> _temp = [];

    while (totalNumber > 0) {
      int number = Random().nextInt(max);
      if (!_temp.contains(number)) {
        _temp.add(number);
        totalNumber--;
      }
    }

    return _temp;
  }

  static String getRandomString(
    int length, {
    bool isNumber = true,
  }) {
    final _chars = isNumber ? '1234567890' : 'abcdefghijklmnopqrstuvwxyz';
    final _rnd = Random();

    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => _chars.codeUnitAt(
          _rnd.nextInt(
            _chars.length,
          ),
        ),
      ),
    );
  }

  static int getNumberLength(ContactNumber contactNumber) {
    int _maxNumLength = 0;

    List<String> letters = contactNumber.numberFormat.numberFormat.split("");

    for (var letter in letters) {
      _maxNumLength += int.parse(letter);
    }

    return _maxNumLength;
  }

  static bool isValidNumberLength(ContactNumber contactNumber) {
    return contactNumber.number.length + 1 <= getNumberLength(contactNumber);
  }
}
