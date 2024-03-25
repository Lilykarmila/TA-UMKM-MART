import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ta_ecommerce/common/widgets/loaders/loaders.dart';
import 'package:ta_ecommerce/data/repositories/authentication_repository.dart';
import 'package:ta_ecommerce/utils/constans/image_strings.dart';
import 'package:ta_ecommerce/utils/popups/full_screen_loader.dart';
import 'package:ta_ecommerce/view/authentication/password_configuration/reset_password.dart';

import '../../utils/network_manager.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController instance = Get.find();

  /// variable
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// send reset password email
  sendPasswordResetEmail() async {
    try {
      // start loading
      TFullScreenLoader.openLoadingDialog('Sedang memproses permintaan anda...', TImages.docerAnimation);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // send email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      // remove loader
      TFullScreenLoader.stopLoading();

      //show success screen
      TLoaders.successSnackBar(
          title: 'Email terkirim', message: 'Tautan email telah dikirim untuk mereset kata sandi Anda.'.tr);

      // redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      // remove loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      // start loading
      TFullScreenLoader.openLoadingDialog('Sedang memproses permintaan anda...', TImages.docerAnimation);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // send email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // remove loader
      TFullScreenLoader.stopLoading();

      //show success screen
      TLoaders.successSnackBar(
          title: 'Email terkirim', message: 'Tautan email telah dikirim untuk mereset kata sandi Anda.'.tr);
    } catch (e) {
      // remove loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
