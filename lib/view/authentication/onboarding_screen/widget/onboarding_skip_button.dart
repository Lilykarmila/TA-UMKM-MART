import 'package:flutter/material.dart';
import 'package:ta_ecommerce/controller/auth_controller/onboarding_controller.dart';

import '../../../../utils/constans/sizes.dart';
import '../../../../utils/devices/devices_utility.dart';

class OnBoardingSkipButton extends StatelessWidget {
  const OnBoardingSkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: TDeviceUtils.getAppbarHeight(),
        right: TSizes.defaultSpace,
        child: TextButton(
          onPressed: () => OnBoardingController.instance.skipPage(),
          child: const Text('Skip'),
        ));
  }
}
