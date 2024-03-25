import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_ecommerce/controller/auth_controller/onboarding_controller.dart';
import 'package:ta_ecommerce/utils/constans/image_strings.dart';
import 'package:ta_ecommerce/utils/constans/text_strings.dart';
import 'widget/onboarding_dot_navogation.dart';
import 'widget/onboarding_next_button.dart';
import 'widget/onboarding_page.dart';
import 'widget/onboarding_skip_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subTitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subTitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subTitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          ///--- Skip Button
          OnBoardingSkipButton(),

          ///-- Dot smooth indicator
          onBoardingDotNavigation(),

          /// circular button
          OnboardingNextButton()
        ],
      ),
    );
  }
}
