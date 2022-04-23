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

  static String formatNumberAsCountryCode(ContactNumber contactNumber) {
    String _num = "${contactNumber.numberFormat.countryCode} ";

    String _tempNum = contactNumber.number;

    contactNumber.numberFormat.numberFormat.split("").forEach((element) {
      int _count = int.parse(element);

      _num += _tempNum.substring(0, _count);
      _tempNum = _tempNum.substring(_count);
      _num += " ";
    });

    return _num;
  }

  static String formatTwoDigit(int number) {
    return number > 9? number.toString() : "0"+number.toString();
  }

  static String secondToMinute(int second) {
    return "${formatTwoDigit(second ~/ 60)} : ${formatTwoDigit(second % 60)}";
  }
}
