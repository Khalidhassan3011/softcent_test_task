import 'package:flutter_test/flutter_test.dart';
import 'package:softcent_test_task/app/common/helper/helper.dart';

void main() {
  test("Test secondToMinute function from Helper class", () {

    String result = Helper.secondToMinute(10);
    expect(result, "00 : 10");

    result = Helper.secondToMinute(5);
    expect(result, "00 : 05");

    result = Helper.secondToMinute(120);
    expect(result, "02 : 00");

  });

  test("Test formatTwoDigit function from Helper class", () {

    String result = Helper.formatTwoDigit(10);
    expect(result, "10");

    result = Helper.formatTwoDigit(5);
    expect(result, "05");

  });
}
