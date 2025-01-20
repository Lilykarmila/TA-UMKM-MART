import 'package:flutter/material.dart';
import 'package:ta_ecommerce/utils/constans/sizes.dart';
import 'package:ta_ecommerce/utils/constans/text_strings.dart';

import 'widget/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// title
              Text(TTexts.signupTitle, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// form
              const TSignUpForm(),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// divider
              // TFormDivider(dividerText: TTexts.orSignUpWith.capitalize!),
              // SizedBox(height: TSizes.spaceBtwSections),

              /// footer
              // TSocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
