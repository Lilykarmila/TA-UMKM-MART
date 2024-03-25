import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ta_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ta_ecommerce/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:ta_ecommerce/common/widgets/text/section_heading.dart';
import 'package:ta_ecommerce/data/repositories/authentication_repository.dart';
import 'package:ta_ecommerce/utils/constans/colors.dart';
import 'package:ta_ecommerce/utils/constans/sizes.dart';
import 'package:ta_ecommerce/view/personalization/address/address.dart';

import '../../../common/widgets/custom_shape/primary_header_container.dart';
import '../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../../screens/orders/order.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// appbar
                  TAppBar(
                    title:
                        Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white)),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),

                  /// user profile card
                  TUserProfileTile(),
                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            /// body
            Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  // /// account settings
                  // TSectionHeading(title: 'Pengaturan akun', showActionButton: false),
                  // SizedBox(height: TSizes.spaceBtwItem),
                  //
                  // TSettingsMenuTile(
                  //     icon: Iconsax.safe_home,
                  //     title: 'Alamat saya',
                  //     subTitle: 'Set shopping delivery adress',
                  //     onTap: () => Get.to(() => UserAddressScreen())),
                  // // TSettingsMenuTile(
                  // //     icon: Iconsax.shopping_cart, title: 'My Cart', subTitle: 'Set shopping delivery adress'),
                  // TSettingsMenuTile(
                  //     icon: Iconsax.bag_tick,
                  //     title: 'Pesanan saya',

                  //     subTitle: 'Set shopping delivery adress',
                  //     onTap: () => Get.to(() => OrderScreen())),
                  //
                  // // TSettingsMenuTile(
                  // //     icon: Iconsax.bank, title: 'Bank Account', subTitle: 'Set shopping delivery adress'),
                  // // TSettingsMenuTile(
                  // //     icon: Iconsax.discount_shape, title: 'My Coupons', subTitle: 'Set shopping delivery adress'),
                  // TSettingsMenuTile(
                  //     icon: Iconsax.notification, title: 'Notifikasi', subTitle: 'Set shopping delivery adress'),
                  // TSettingsMenuTile(
                  //     icon: Iconsax.security_card, title: 'Account Privacy', subTitle: 'Set shopping delivery adress'),

                  /// app settings
                  // SizedBox(height: TSizes.spaceBtwSections),
                  // TSectionHeading(title: 'Pengaturan Aplikasi', showActionButton: false),
                  // TSettingsMenuTile(
                  //     icon: Iconsax.document_upload, title: 'Load Data', subTitle: 'et shopping delivery adress'),
                  // // TSettingsMenuTile(
                  // //   icon: Iconsax.security_user,
                  // //   title: 'Safe Mode',
                  // //   subTitle: 'et shopping delivery adress',
                  // //   trailing: Switch(value: false, onChanged: (value) {}),
                  // // ),
                  // // TSettingsMenuTile(
                  // //     icon: Iconsax.image,
                  // //     title: 'HD Image Quality',
                  // //     subTitle: 'et shopping delivery adress',
                  // //     trailing: Switch(value: false, onChanged: (value) {})),
                  // TSettingsMenuTile(
                  //     icon: Iconsax.location,
                  //     title: 'Geolocation',
                  //     subTitle: 'et shopping delivery adress',
                  //     trailing: Switch(value: true, onChanged: (value) {})),

                  /// Logout Button
                  // SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => AuthenticationRepository.instance.logout(),
                      child: Text('Keluar'),
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections * 2.5),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
