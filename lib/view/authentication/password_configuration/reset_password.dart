import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_ecommerce/controller/auth_controller/forget_password_controller.dart';
import 'package:ta_ecommerce/utils/constans/image_strings.dart';
import 'package:ta_ecommerce/utils/constans/sizes.dart';
import 'package:ta_ecommerce/utils/constans/text_strings.dart';
import 'package:ta_ecommerce/view/authentication/login/login.dart';

import '../../../utils/helper/helper_functions.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key, required this.email}) : super(key: key);

  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: () => Get.back(), icon: Icon(CupertinoIcons.clear))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(children: [
            /// image
            Image(image: AssetImage(TImages.deliveredEmailIllustrations), width: THelperFunctions.screenWidth() * 0.6),
            SizedBox(height: TSizes.spaceBtwSections),

            /// title and subtitle
            Text(email, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
            SizedBox(height: TSizes.spaceBtwItem),
            Text(TTexts.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
            SizedBox(height: TSizes.spaceBtwItem),
            Text(TTexts.changeYourPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
            SizedBox(height: TSizes.spaceBtwSections),

            /// button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.offAll(() => LoginScreen()),
                child: Text(TTexts.done),
              ),
            ),
            SizedBox(height: TSizes.spaceBtwItem),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () => ForgetPasswordController.instance.resendPasswordResetEmail(email),
                child: Text(TTexts.resendEmail),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
