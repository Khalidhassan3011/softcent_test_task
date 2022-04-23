import 'package:google_fonts/google_fonts.dart';

import '../../util/exports.dart';

class Style {
  static _TextStyle get textStyle => _TextStyle();

  static _ButtonStyle get buttonStyle => _ButtonStyle();

  static _Other get other => _Other();
}

class _TextStyle {
  final TextStyle semiBoldStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize16,
    fontWeight: FontWeight.w600,
  );

  final TextStyle boldStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize22,
    fontWeight: FontWeight.w700,
  );

  final TextStyle regularStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize18,
    fontWeight: FontWeight.w400,
  );

  final TextStyle buttonTextStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize16,
    fontWeight: FontWeight.w700,
  );

  final TextStyle buttonTextKeyboard = GoogleFonts.dmSans(
    fontSize: Dimens.keyboardButtonSize,
    fontWeight: FontWeight.w500,
    color: AppColors.colorTextGrey,
  );

  final TextStyle appTitle = GoogleFonts.dmSans(
    fontSize: Dimens.appTitle,
    fontWeight: FontWeight.w700,
    color: AppColors.colorPrimary,
  );

  final TextStyle hints = GoogleFonts.dmSans(
    fontSize: Dimens.fontSize14,
    fontWeight: FontWeight.w400,
    color: AppColors.colorTextGrey,
  );

  final TextStyle resend = GoogleFonts.dmSans(
    fontSize: Dimens.fontSize16,
    color: AppColors.colorTextGrey,
    letterSpacing: -.36,
  );



  static final TextStyle _textStyle = TextStyle(
    color: Colors.black,
    fontSize: Dimens.fontSize14,
  );
}

class _ButtonStyle {}

class _Other {
  final InputDecoration inputDecoration = const InputDecoration(
    labelStyle: TextStyle(color: Color(0xFF6200EE)),
    filled: true,
    border: InputBorder.none,
    focusedBorder: InputBorder.none,
    enabledBorder: InputBorder.none,
    errorBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
  );

  final InputDecoration chatInputDecoration = const InputDecoration(
    labelStyle: TextStyle(color: Color(0xFF6200EE)),
    filled: true,
    border: _outlineInputBorder,
    focusedBorder: _outlineInputBorder,
    enabledBorder: _outlineInputBorder,
    errorBorder: _outlineInputBorder,
    disabledBorder: _outlineInputBorder,
  );

  // helper
  static const OutlineInputBorder _outlineInputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.colorPrimary, width: 0.0),
  );
}
