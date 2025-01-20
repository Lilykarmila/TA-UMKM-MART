import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ta_ecommerce/controller/auth_controller/user_controller.dart';
import 'package:ta_ecommerce/view/personalization/profile/profile.dart';

import '../../../utils/constans/colors.dart';
import '../../../utils/constans/image_strings.dart';
import '../images/t_circular_image.dart';
import '../loaders/shimmer_loader.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return ListTile(
      // leading: TCircleAvatarImage(backgroundImage: TImages.user),

      // images
      leading: Obx(() {
        final networkImage = controller.user.value.profilePicture;
        final image = networkImage.isNotEmpty ? networkImage : TImages.user;
        return controller.imageUploading.value
            ? const TShimmerEffect(width: 70, height: 70, radius: 70)
            : TCircularImage(
                image: image, width: 60, height: 60, isNetworkImage: networkImage.isNotEmpty, fit: BoxFit.contain);
      }),
      // email
      title: Text(controller.user.value.fullName,
          style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white)),
      subtitle:
          Text(controller.user.value.email, style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white)),
      trailing:
          IconButton(onPressed: () => Get.to(() => const ProfileScreen()), icon: const Icon(Iconsax.edit), color: TColors.white),
    );
  }
}
