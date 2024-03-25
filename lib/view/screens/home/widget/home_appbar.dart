import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_ecommerce/controller/auth_controller/user_controller.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/loaders/shimmer_loader.dart';
import '../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../utils/constans/colors.dart';
import '../../../../utils/constans/text_strings.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TTexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.grey)),
          Obx(() {
            if (controller.profileLoading.value) {
              // displayy a shimmer loader while user profile is being loaded
              return TShimmerEffect(width: 80, height: 15);
            } else {
              return Text(controller.user.value.fullName,
                  style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white));
            }
          }),
        ],
      ),
      actions: [TCardCounterIcon(onPressed: () {}, iconColor: TColors.white)],
    );
  }
}
