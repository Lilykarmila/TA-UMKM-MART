import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ta_ecommerce/common/widgets/loaders/loaders.dart';
import 'package:ta_ecommerce/data/repositories/authentication_repository.dart';
import 'package:ta_ecommerce/data/repositories/user_repository.dart';
import 'package:ta_ecommerce/utils/constans/image_strings.dart';
import 'package:ta_ecommerce/utils/popups/full_screen_loader.dart';
import 'package:ta_ecommerce/view/authentication/signup/verify_email.dart';

import '../../model/user_model.dart';
import '../../utils/network_manager.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// variable
  final hidePassword = true.obs; // observable for hiding/showing password
  final privacyPolicy = true.obs;
  final isMerchant = false.obs; // observable for hiding/showing password
  final email = TextEditingController();
  final fullName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); // key for form validation

  /// --- SIGNUP
  void signup() async {
    try {
      // start loading
      TFullScreenLoader.openLoadingDialog('Informasi anda sedang di prosess...', TImages.docerAnimation);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading(); // remove loader
        return;
      }

      // form validation
      if (!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading(); // remove loader
        return;
      }

      // privacy policy check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
          title: 'Accept privacy policy',
          message: 'In order to create account, you must have to read and accept the Privacy Policy & Term of Use',
        );
        TFullScreenLoader.stopLoading();
        return;
      }

      // register user in the firebase authentication & save user data in the firebase
      final userCredential =
          await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      /// save authenticated user data in the firebase fire store
      final newUser = UserModel(
          uid: userCredential.user!.uid,
          fullName: fullName.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          profilePicture: '',
          creationTime: userCredential.user!.metadata.creationTime!.toIso8601String(),
          lastSignInTime: userCredential.user!.metadata.lastSignInTime!.toIso8601String(),
          type: isMerchant.value ? "merchant" : "user",
          updateTime: DateTime.now().toIso8601String());

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // remove loader
      TFullScreenLoader.stopLoading();

      // show success message
      TLoaders.successSnackBar(
          title: 'Selamat', message: 'Akun anda telah selesai dibuat! Verifikasi email untuk melanjutkan.');

      // move to verify email screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      // remove loader
      TFullScreenLoader.stopLoading();

      // show some generic error to the user
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
