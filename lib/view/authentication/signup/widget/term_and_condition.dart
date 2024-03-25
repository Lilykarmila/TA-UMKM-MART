import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth_controller/signup_controller.dart';
import '../../../../utils/constans/colors.dart';
import '../../../../utils/constans/sizes.dart';
import '../../../../utils/constans/text_strings.dart';
import '../../../../utils/helper/helper_functions.dart';

class TTermAndConditionCheckbox extends StatelessWidget {
  const TTermAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
                width: 24,
                height: 24,
                child: Obx(
                      () => Checkbox(
                      value: controller.privacyPolicy.value,
                      onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value),
                )),
            SizedBox(width: TSizes.spaceBtwItem),
            Text.rich(
              TextSpan(children: [
                TextSpan(text: '${TTexts.iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: TTexts.privacyPolicy,
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? TColors.white : TColors.primaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor: dark ? TColors.white : TColors.primaryColor,
                    )),
                TextSpan(text: ' ${TTexts.and} ', style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: TTexts.termOfUse,
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? TColors.white : TColors.primaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor: dark ? TColors.white : TColors.primaryColor,
                    )),
              ]),
            )
          ],
        ),
        Row(
          children: [
            SizedBox(
                width: 24,
                height: 24,
                child: Obx(
                      () => Checkbox(
                      value: controller.isMerchant.value,
                      onChanged: (value) => controller.isMerchant.value = !controller.isMerchant.value),
                )),
            SizedBox(width: TSizes.spaceBtwItem),
            Text('Sign Up as Merchant', style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ],
    );
  }
}
