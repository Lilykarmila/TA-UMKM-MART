import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_ecommerce/common/widgets/login_signup/form_divider.dart';
import 'package:ta_ecommerce/common/widgets/login_signup/social_buttons.dart';
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
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// title
              Text(TTexts.signupTitle, style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(height: TSizes.spaceBtwSections),

              /// form
              TSignUpForm(),
              SizedBox(height: TSizes.spaceBtwSections),

              /// divider
              TFormDivider(dividerText: TTexts.orSignUpWith.capitalize!),
              SizedBox(height: TSizes.spaceBtwSections),

              /// footer
              TSocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
