import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ta_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ta_ecommerce/common/widgets/images/t_circular_image.dart';
import 'package:ta_ecommerce/common/widgets/loaders/shimmer_loader.dart';
import 'package:ta_ecommerce/common/widgets/text/section_heading.dart';
import 'package:ta_ecommerce/controller/auth_controller/user_controller.dart';
import 'package:ta_ecommerce/utils/constans/image_strings.dart';
import 'package:ta_ecommerce/utils/constans/sizes.dart';
import 'package:ta_ecommerce/view/personalization/profile/widget/change_username.dart';

import 'widget/change_name.dart';
import 'widget/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const TAppBar(title: Text('Profil Saya'), showBackArrow: true),

      /// body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// profile picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty ? networkImage : TImages.user;
                      return controller.imageUploading.value
                          ? const TShimmerEffect(width: 90, height: 90, radius: 90)
                          : TCircularImage(
                              image: image, width: 80, height: 80, isNetworkImage: networkImage.isNotEmpty);
                    }),
                    TextButton(onPressed: () => controller.uploadUserProfilePicture(), child: const Text('Ubah Foto Profil')),
                  ],
                ),
              ),

              /// detail
              const SizedBox(height: TSizes.spaceBtwItem / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItem),

              /// heading profile info
              const TSectionHeading(title: 'Informasi Profil', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItem),

              TProfileMenu(
                title: 'Nama',
                value: controller.user.value.fullName,
                onPressed: () => Get.to(() => const ChangeName()),
                icon: Iconsax.arrow_right_34,
              ),
              TProfileMenu(
                title: 'Username',
                value: controller.user.value.username,
                onPressed: () => Get.to(() => ChangeUsername()),
                icon: Iconsax.arrow_right_34,
              ),

              const SizedBox(height: TSizes.spaceBtwItem / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItem),

              ///heading personal info
              // TProfileMenu(title: 'User ID', value: controller.user.value.uid, icon: Iconsax.copy, onPressed: () {}),
              TProfileMenu(title: 'E-Mail', value: controller.user.value.email),
              TProfileMenu(title: 'Akun type', value: controller.user.value.type.toString()),
              // TProfileMenu(title: 'Gender', value: 'Female', onPressed: () {}),
              // TProfileMenu(title: 'Date of birth', value: '12 oct 2000', onPressed: () {}),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItem),
              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text('Hapus Akun', style: TextStyle(color: Colors.red)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
