import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ta_ecommerce/controller/auth_controller/signup_controller.dart';
import 'package:ta_ecommerce/utils/validators/validation.dart';
import 'package:ta_ecommerce/view/authentication/signup/verify_email.dart';
import 'package:ta_ecommerce/view/authentication/signup/widget/term_and_condition.dart';

import '../../../../utils/constans/sizes.dart';
import '../../../../utils/constans/text_strings.dart';

class TSignUpForm extends StatelessWidget {
  TSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          /// name
          // Row(
          //   children: [
          //     Expanded(
          //       child: TextFormField(
          //         expands: false,
          //         decoration: InputDecoration(labelText: TTexts.firstName, prefixIcon: Icon(Iconsax.user)),
          //       ),
          //     ),
          //     SizedBox(width: TSizes.spaceBtwInputFields),
          //     Expanded(
          //       child: TextFormField(
          //         expands: false,
          //         decoration: InputDecoration(labelText: TTexts.lastName, prefixIcon: Icon(Iconsax.user)),
          //       ),
          //     ),
          //   ],
          // ),
          // SizedBox(height: TSizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.fullName,
            validator: (value) => TValidator.validateEmptyText('Full name', value),
            expands: false,
            decoration: InputDecoration(labelText: TTexts.fulllName, prefixIcon: Icon(Iconsax.user)),
          ),
          SizedBox(height: TSizes.spaceBtwInputFields),

          /// username
          TextFormField(
            controller: controller.username,
            validator: (value) => TValidator.validateEmptyText('Username', value),
            expands: false,
            decoration: InputDecoration(labelText: TTexts.username, prefixIcon: Icon(Iconsax.user_edit)),
          ),
          SizedBox(height: TSizes.spaceBtwInputFields),

          /// email
          TextFormField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            expands: false,
            decoration: InputDecoration(labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          SizedBox(height: TSizes.spaceBtwInputFields),

          /// password
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => TValidator.validatePassword(value),
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
          SizedBox(height: TSizes.spaceBtwSections),

          /// term and contiditions
          TTermAndConditionCheckbox(),
          SizedBox(height: TSizes.spaceBtwSections),


          ///  sign up  button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: Text(TTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
