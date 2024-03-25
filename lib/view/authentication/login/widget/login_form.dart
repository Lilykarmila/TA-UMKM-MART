import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ta_ecommerce/controller/auth_controller/login_controller.dart';
import 'package:ta_ecommerce/navigation_menu.dart';
import 'package:ta_ecommerce/utils/validators/validation.dart';
import 'package:ta_ecommerce/view/authentication/password_configuration/forget_password.dart';
import 'package:ta_ecommerce/view/authentication/signup/signup.dart';

import '../../../../utils/constans/sizes.dart';
import '../../../../utils/constans/text_strings.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            /// email
            TextFormField(
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),
              decoration: InputDecoration(prefixIcon: Icon(Iconsax.direct_right), labelText: TTexts.email),
            ),
            SizedBox(height: TSizes.spaceBtwInputFields),

            /// password
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => TValidator.validateEmptyText('Password', value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: TTexts.password,
                  prefixIcon: Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                  ),
                ),
              ),
            ),
            SizedBox(height: TSizes.spaceBtwInputFields / 2),

            /// remember me & forget password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    /// remember me
                    Obx(
                      () => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value),
                    ),
                    Text(TTexts.rememberMe),
                  ],
                ),

                /// forget password
                TextButton(onPressed: () => Get.to(() => ForgetPassword()), child: Text(TTexts.forgetPassword)),
              ],
            ),
            SizedBox(height: TSizes.spaceBtwSections),

            /// SIGN IN BUTTON
            SizedBox(
                width: double.infinity,
                child:
                    ElevatedButton(onPressed: () => controller.emailAndPasswordSignIn(), child: Text(TTexts.signIn))),
            const SizedBox(height: TSizes.spaceBtwItem),

            /// create account button
            SizedBox(
                width: double.infinity,
                child:
                    OutlinedButton(onPressed: () => Get.to(() => SignupScreen()), child: Text(TTexts.createAccount))),

            const SizedBox(height: TSizes.spaceBtwItem),


            // const SizedBox(height: 4.0),
          ],
        ),
      ),
    );
  }
}
