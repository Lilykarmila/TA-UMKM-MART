import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_ecommerce/common/styles/spacing_style.dart';
import 'package:ta_ecommerce/utils/constans/sizes.dart';
import 'package:ta_ecommerce/utils/constans/text_strings.dart';
import 'package:ta_ecommerce/utils/helper/helper_functions.dart';
import 'package:ta_ecommerce/view/authentication/login/widget/login_header.dart';
import '../../../common/widgets/login_signup/form_divider.dart';
import '../../../common/widgets/login_signup/social_buttons.dart';
import 'widget/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo, Title and Subtitle
              TLoginHeader(dark: dark),

              /// form
              TLoginForm(),

              /// divider
              // TFormDivider(dividerText: TTexts.orSignIpWith.capitalize!),
              // SizedBox(height: TSizes.spaceBtwItem),

              /// footer
              // TSocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
