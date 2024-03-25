import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_ecommerce/utils/constans/colors.dart';
import 'package:ta_ecommerce/utils/helper/helper_functions.dart';

import '../../common/widgets/loaders/animation_loader.dart';

/// a utility class for managing a full screen loading dialog
class TFullScreenLoader {
  /// this method doesn return anyting
  /// open a full screen loading dialog with a given text and animation
  /// parameter :
  ///  - text : teh text to be displayed in the loading dialog
  ///  - animation : the  lotie animation to be shown

  static void openLoadingDialog(String text, String animation) {
    showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (_) => PopScope(
              canPop: false,
              child: Container(
                color: THelperFunctions.isDarkMode(Get.context!) ? TColors.dark : TColors.white,
                width: double.infinity,
                height: double.infinity,
                child: Expanded(
                  child: Column(
                    children: [
                      const SizedBox(height: 250),
                      TAnimationLoaderWidget(text: text, animation: animation),
                    ],
                  ),
                ),
              ),
            ));
  }

  /// stop the currently open loading dialog
  /// this method doesn't return anything
  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop(); // close the dialog using the navigator
  }
}
