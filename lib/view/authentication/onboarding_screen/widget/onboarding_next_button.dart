import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ta_ecommerce/controller/auth_controller/onboarding_controller.dart';
import 'package:ta_ecommerce/utils/constans/sizes.dart';

import '../../../../utils/constans/colors.dart';
import '../../../../utils/devices/devices_utility.dart';
import '../../../../utils/helper/helper_functions.dart';

class OnboardingNextButton extends StatelessWidget {
  const OnboardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
      right: TSizes.defaultSpace,
      bottom: TDeviceUtils.getBottomNavigationBarheight(),
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(), backgroundColor: dark ? TColors.primaryColor : Colors.black),
        child: const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}
