import 'package:animated_text_kit/animated_text_kit.dart';

import '../../../common/util/exports.dart';
import '../controllers/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: Utils.appExitConfirmation,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Softcent"),
          elevation: 0,
          backgroundColor: AppColors.colorPrimary,
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _emoji,
              SizedBox(height: 30.h),
              _welcome,
              _animText,
            ],
          ),
        ),
      ),
    );
  }

  Widget get _emoji => Text(
        "☺",
        style: Style.textStyle.hints.copyWith(
          fontSize: 100,
          color: AppColors.colorPrimary,
        ),
      );

  Widget get _welcome => Text(
        "Welcome To",
        style: Style.textStyle.hints.copyWith(
          fontSize: 30,
        ),
      );

  Widget get _animText => DefaultTextStyle(
        style: Style.textStyle.hints.copyWith(
          fontSize: 50,
          color: AppColors.colorPrimary,
          fontWeight: FontWeight.w700,
        ),
        child: AnimatedTextKit(
          repeatForever: true,
          pause: const Duration(seconds: 1),
          animatedTexts: [
            TypewriterAnimatedText(
              'Softcent'.toUpperCase(),
              speed: const Duration(
                milliseconds: 200,
              ),
              cursor: "",
            ),
          ],
        ),
      );
}
