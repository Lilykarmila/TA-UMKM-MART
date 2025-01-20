import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ta_ecommerce/common/styles/spacing_style.dart';

import '../../../utils/constans/sizes.dart';
import '../../../utils/constans/text_strings.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {Key? key, required this.image, required this.title, required this.subTitle, required this.onPressed})
      : super(key: key);

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              /// image
              Lottie.asset(image, width: MediaQuery.of(context).size.width * 0.6),

              /// title and subtitle
              Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: TSizes.spaceBtwItem),
              Text(subTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// button
              SizedBox(
                  width: double.infinity, child: ElevatedButton(onPressed: onPressed, child: const Text(TTexts.tContinue))),
            ],
          ),
        ),
      ),
    );
  }
}
