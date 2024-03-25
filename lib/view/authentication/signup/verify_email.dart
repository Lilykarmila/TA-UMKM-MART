import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_ecommerce/common/widgets/succes_screen/succes_screen.dart';
import 'package:ta_ecommerce/controller/auth_controller/verify_email_controller.dart';
import 'package:ta_ecommerce/data/repositories/authentication_repository.dart';
import 'package:ta_ecommerce/utils/constans/image_strings.dart';
import 'package:ta_ecommerce/utils/constans/sizes.dart';
import 'package:ta_ecommerce/utils/constans/text_strings.dart';
import 'package:ta_ecommerce/utils/helper/helper_functions.dart';
import 'package:ta_ecommerce/view/authentication/login/login.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({Key? key, this.email}) : super(key: key);

  final String? email;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => AuthenticationRepository.instance.logout(), icon: Icon(CupertinoIcons.clear)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            /// image
            Image(
              image: AssetImage(TImages.deliveredEmailIllustrations),
              width: THelperFunctions.screenWidth() * 0.6,
            ),

            /// title and subtitle
            Text(TTexts.confirmEmail, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
            SizedBox(height: TSizes.spaceBtwItem),
            Text(email ?? '', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
            SizedBox(height: TSizes.spaceBtwItem),
            Text(TTexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
            SizedBox(height: TSizes.spaceBtwSections),

            /// button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.checkEmailVerificationStatus(), child: Text(TTexts.tContinue))),
            SizedBox(height: TSizes.spaceBtwItem),
            SizedBox(
                width: double.infinity,
                child:
                    TextButton(onPressed: () => controller.sendEmailVerification(), child: Text(TTexts.resendEmail))),
          ],
        ),
      ),
    );
  }
}
