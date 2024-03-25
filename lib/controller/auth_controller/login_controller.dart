import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ta_ecommerce/common/widgets/loaders/loaders.dart';
import 'package:ta_ecommerce/controller/auth_controller/user_controller.dart';
import 'package:ta_ecommerce/data/repositories/authentication_repository.dart';
import 'package:ta_ecommerce/utils/constans/image_strings.dart';
import 'package:ta_ecommerce/utils/popups/full_screen_loader.dart';
import '../../data/repositories/user_repository.dart';
import '../../model/user_model.dart';
import '../../utils/network_manager.dart';

class LoginController extends GetxController {
  /// variabel
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());
  final uRepo = UserRepository.instance;

  // apply remember me
  @override
  // void onInit() {
  //   email.text = localStorage.read('REMEMBER_ME_EMAIL');
  //   password.text = localStorage.read('REMEMBER_ME_PASSWORD');
  //   super.onInit();
  // }

  /// email and password sign in
  Future<void> emailAndPasswordSignIn() async {
    try {
      // start loading
      TFullScreenLoader.openLoadingDialog('Sedang masuk...', TImages.docerAnimation);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading(); // remove loader
        return;
      }

      // form validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading(); // remove loader
        return;
      }

      // save data if remember me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // login user using emila & password authentication
      final userCredentials =
          await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // remove loader
      TFullScreenLoader.stopLoading();

      UserModel user = await uRepo.fetchUserDetails();
      print("user ${user.type}");
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('type', user.type.toString());
      prefs.setString('name', user.fullName);
      prefs.setString('image', user.profilePicture);
      prefs.setString('uid', user.uid);
      // redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  // google SignIn authentication
  Future<void> googleSignIn() async {
    try {
      // start loading
      TFullScreenLoader.openLoadingDialog('Sedang masuk...', TImages.docerAnimation);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading(); // remove loader
        return;
      }

      // google authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      // save user record
      await userController.saveUserRecord(userCredentials);

      // remove loader
      TFullScreenLoader.stopLoading();

      // redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // remove loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
