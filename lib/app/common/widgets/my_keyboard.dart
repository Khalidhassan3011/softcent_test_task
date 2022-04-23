import '../util/exports.dart';
import 'my_appbar_icon.dart';

class MyKeyboard extends StatelessWidget {
  final Function(String value) onChange;
  final Function() onClear;
  final double? height;

  const MyKeyboard({
    Key? key,
    required this.onChange,
    required this.onClear,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.colorKeyboardBg,
      ),
      height: height ?? Dimens.keyboardHeight,
      padding: EdgeInsets.symmetric(horizontal: Dimens.marginH),
      child: _numKeypad,
    );
  }

  Widget get _numKeypad => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _row("1", "2", "3"),
          _row("4", "5", "6"),
          _row("7", "8", "9"),
          _lastRow,
        ],
      );

  Widget _row(String action1, String action2, String action3) => Row(
        children: [
          _numKey(action1),
          _numKey(action2),
          _numKey(action3),
        ],
      );

  Widget get _lastRow => Row(
        children: [
          _numKey(""),
          _numKey("0"),
          _actionKey(),
        ],
      );

  Widget _numKey(String number) => Expanded(
        child: InkWell(
          onTap: () => number.isEmpty? null : onChange(number),
          child: Center(
            child: Text(
              number,
              style: Style.textStyle.buttonTextKeyboard,
            ),
          ),
        ),
      );

  Widget _actionKey() => Expanded(
        child: InkWell(
          onTap: () => onClear(),
          child: Center(
            child: MyAppbarIcon.close,
          ),
        ),
      );
}
