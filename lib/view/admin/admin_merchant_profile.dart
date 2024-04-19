import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ta_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ta_ecommerce/common/widgets/images/t_circle_avatar_images.dart';
import 'package:ta_ecommerce/common/widgets/images/t_circular_image.dart';
import 'package:ta_ecommerce/common/widgets/loaders/shimmer_loader.dart';
import 'package:ta_ecommerce/common/widgets/text/section_heading.dart';
import 'package:ta_ecommerce/controller/auth_controller/user_controller.dart';
import 'package:ta_ecommerce/controller/merchant_controller/merchant_controller.dart';
import 'package:ta_ecommerce/model/merchant_model.dart';
import 'package:ta_ecommerce/utils/constans/image_strings.dart';
import 'package:ta_ecommerce/utils/constans/sizes.dart';

import '../personalization/profile/widget/change_name.dart';
import '../personalization/profile/widget/profile_menu.dart';

class AdminMerchantProfileScreen extends StatelessWidget {
  const AdminMerchantProfileScreen({Key? key, required this.merchant}) : super(key: key);

  final MerchantModel merchant;

  @override
  Widget build(BuildContext context) {
    final merchantController = MerchantController.instance;

    return Scaffold(
      appBar: TAppBar(title: Text(merchant.name), showBackArrow: true),

      /// body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// detail
              Divider(),
              const SizedBox(height: TSizes.spaceBtwItem),

              /// heading profile info
              TSectionHeading(title: 'Informasi Penjual', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItem),

              TProfileMenu(
                title: 'Nama',
                value: merchant.name ?? '', // Menambahkan operator null-aware
                onPressed: () => Get.to(() => ChangeName()),
                icon: Iconsax.arrow_right_34,
              ),
              const SizedBox(height: TSizes.spaceBtwItem / 2),
              const SizedBox(height: TSizes.spaceBtwItem),

              /// heading personal info
              TProfileMenu(
                title: 'Id',
                value: merchant.id ?? '',
              ),
              TProfileMenu(
                title: 'E-Mail',
                value: merchant.email ?? '', // Menambahkan operator null-aware
              ),
              Divider(),
              const SizedBox(height: TSizes.spaceBtwItem),

              /// ----- HAPUS AKUN
              Center(
                child: TextButton(
                  onPressed: () => merchantController.deleteMerchantAccountWarningPopup(merchant.id),
                  child: Text('Hapus Akun', style: TextStyle(color: Colors.red)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
