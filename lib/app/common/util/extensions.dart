import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension BorderRadiusExt on num {
  BorderRadius get borderRadius => BorderRadius.circular(r);

  InputBorder outlineInputBorder({
    BorderSide borderSide = BorderSide.none,
  }) =>
      OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: borderSide,
      );

  BorderSide borderSide({
    Color? color,
    double? width,
    BorderStyle? style,
  }) =>
      BorderSide(
        color: color ?? Colors.white,
        width: toDouble(),
        style: style ?? BorderStyle.solid,
      );
}

extension HexColorExt on String {
  Color get fromHex {
    final buffer = StringBuffer();
    if (length == 6 || length == 7) {
      buffer.write('ff');
    }

    if (startsWith('#')) {
      buffer.write(replaceFirst('#', ''));
    }
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

extension ImageExt on String {
  String get image => 'assets/images/$this.png';

  Image imageAsset({
    Size? size,
    BoxFit? fit,
    Color? color,
  }) =>
      Image.asset(
        this,
        color: color,
        width: size?.width,
        height: size?.height,
        fit: fit,
      );
}

extension AlignWidgetExt on Widget {
  Widget align({
    Alignment alignment = Alignment.center,
  }) =>
      Align(
        alignment: alignment,
        child: this,
      );
}

extension FormatDurationExt on int {
  String formatDuration() {
    final min = this ~/ 60;
    final sec = this % 60;
    return "${min.toString().padLeft(2, "0")}:${sec.toString().padLeft(2, "0")} min";
  }
}

extension DebugLog on String {
  void debugLog() {
    return debugPrint(
      '\n******************************* DebugLog *******************************\n'
      ' $this'
      '\n******************************* DebugLog *******************************\n',
      wrapWidth: 1024,
    );
  }
}

extension PasswordStringValidators on String {
  meetsPasswordRequirements() {
    RegExp regEx = RegExp(r"(?=.*[a-z])(?=.*[A-Z])\w+");
    RegExp regEx2 = RegExp(r"[0-9]");
    return regEx.hasMatch(this) && regEx2.hasMatch(this);
  }
}

extension EmailFormatValidators on String {
  meetsEmailRequirements() {
    RegExp regEx = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return regEx.hasMatch(this);
  }
}

extension GetLastLetter on String {
  getLastLetter() {
    return substring(length - 1);
  }
}

extension RemoveLastLetter on String {
  removeLastLetter() {
    return substring(0, length - 1);
  }
}

extension DemoNumber on String {
  demoNumber() {
    String _number = "";

    List<String> _numbers = split("");

    for (var value in _numbers) {
      for (int i = 0; i < int.parse(value); i++) {
        _number += "X";
      }
      _number += " ";
    }

    return _number;
  }
}
