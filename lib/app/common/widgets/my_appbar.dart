import '../util/exports.dart';

class MyAppBar extends StatelessWidget {
  final Widget icon;
  final Function()? onBackPressed;

  const MyAppBar({
    Key? key,
    required this.icon,
    this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: Dimens.appbarTopMargin,
        left: Dimens.marginH,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: InkWell(
          onTap: onBackPressed ?? () => Get.back(),
          borderRadius: BorderRadius.circular(Dimens.backButtonRadius),
          child: Container(
            height: Dimens.backButtonHeightWidth,
            width: Dimens.backButtonHeightWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimens.backButtonRadius),
              border: Border.all(
                color: AppColors.colorBackButtonBorder,
              ),
            ),
            child: Center(
              child: icon,
            ),
          ),
        ),
      ),
    );
  }
}
