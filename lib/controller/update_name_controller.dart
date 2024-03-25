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
class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final fullName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  // init user data when Home Screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  /// fetch user record
  Future<void> initializeNames() async {
    fullName.text = userController.user.value.fullName;
  }

  Future<void> updateUserName() async {
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
      if (!updateUserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading(); // remove loader
        return;
      }

      // update user's fullName in teh firebase firestore
      Map<String, dynamic> name = {'FullName': fullName.text.trim()};
      await userRepository.updateSingleField(name);

      // update the Rx user value
      userController.user.value.fullName = fullName.text.trim();

      // remove loader
      TFullScreenLoader.stopLoading();

      // show success message
      TLoaders.successSnackBar(title: 'Selamat', message: 'Nama anda berhasil diupdate.');

      // move to previous screen
      Get.off(() => NavigationMenu());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
