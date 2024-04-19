// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:ta_ecommerce/common/widgets/loaders/loaders.dart';
// import 'package:ta_ecommerce/controller/auth_controller/user_controller.dart';
// import 'package:ta_ecommerce/data/repositories/user_repository.dart';
// import 'package:ta_ecommerce/navigation_menu.dart';
// import 'package:ta_ecommerce/utils/constans/image_strings.dart';
// import 'package:ta_ecommerce/utils/popups/full_screen_loader.dart';
// import 'package:ta_ecommerce/view/personalization/profile/profile.dart';
//
// import '../utils/network_manager.dart';
//
// class UpdateUsernameController extends GetxController {
//   static UpdateUsernameController get instance => Get.find();
//
//   late final TextEditingController username;
//   final userController = UserController.instance;
//   final userRepository = Get.put(UserRepository());
//   GlobalKey<FormState> updateUsernameFormKey = GlobalKey<FormState>();
//
//   @override
//   void onInit() {
//     super.onInit();
//     username = TextEditingController(text: userController.user.value.username);
//   }
//
//   Future<void> updateUsername() async {
//     try {
//       TFullScreenLoader.openLoadingDialog('Sedang mengupdate informasi anda...', TImages.docerAnimation);
//
//       final isConnected = await NetworkManager.instance.isConnected();
//       if (!isConnected) {
//         TFullScreenLoader.stopLoading();
//         return;
//       }
//
//       if (!updateUsernameFormKey.currentState!.validate()) {
//         TFullScreenLoader.stopLoading();
//         return;
//       }
//
//       Map<String, dynamic> name = {'Username': username.text.trim()};
//       await userRepository.updateSingleField(name);
//
//       userController.user.value.username = username.text.trim();
//
//       TFullScreenLoader.stopLoading();
//       TLoaders.successSnackBar(title: 'Selamat', message: 'Nama anda berhasil diupdate.');
//
//       Get.off(() => NavigationMenu());
//     } catch (e) {
//       TFullScreenLoader.stopLoading();
//       TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
//     }
//   }
// }
///-----------------
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ta_ecommerce/common/widgets/loaders/loaders.dart';
import 'package:ta_ecommerce/controller/auth_controller/user_controller.dart';
import 'package:ta_ecommerce/data/repositories/user_repository.dart';
import 'package:ta_ecommerce/navigation_menu.dart';
import 'package:ta_ecommerce/utils/constans/image_strings.dart';
import 'package:ta_ecommerce/utils/popups/full_screen_loader.dart';
import 'package:ta_ecommerce/view/personalization/profile/profile.dart';

import '../utils/network_manager.dart';

/// controller to manage user-related functionality.
class UpdateUsernameController extends GetxController {
  static UpdateUsernameController get instance => Get.find();

  final username = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUsernameFormKey = GlobalKey<FormState>();

  // init user data when Home Screen appears
  @override
  void onInit() {
    initializeUsername();
    super.onInit();
  }

  /// fetch user record
  Future<void> initializeUsername() async {
    username.text = userController.user.value.username;
  }

  Future<void> updateUsername() async {
    try {
      // start loading
      TFullScreenLoader.openLoadingDialog('Sedang mengupdate informasi anda...', TImages.docerAnimation);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading(); // remove loader
        return;
      }

      // form validation
      if (!updateUsernameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading(); // remove loader
        return;
      }

      // update user's username in the firebase firestore
      Map<String, dynamic> name = {'Username': username.text.trim()};
      await userRepository.updateSingleField(name);

      // update the Rx user value
      userController.user.value.updateUsername(username.text.trim());

      // remove loader
      TFullScreenLoader.stopLoading();

      // show success message
      TLoaders.successSnackBar(title: 'Selamat', message: 'Username anda berhasil diupdate.');

      // move to previous screen
      Get.off(() => NavigationMenu());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
