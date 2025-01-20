import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ta_ecommerce/common/widgets/images/t_circle_avatar_images.dart';

import '../../../utils/constans/colors.dart';
import '../../../utils/constans/image_strings.dart';
import '../../../utils/constans/sizes.dart';
import '../../../utils/devices/devices_utility.dart';
import '../../../utils/helper/helper_functions.dart';

class THeaderChat extends StatelessWidget implements PreferredSizeWidget {
  const THeaderChat(
      {super.key,
      this.title,
      this.showBackArrow = false,
      this.leadingIcon,
      this.actions,
      this.leadingOnPressed,
      required this.merchantName,
      required this.merchantImage});

  final Widget? title;
  final bool showBackArrow;

  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final String merchantName;
  final String merchantImage;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.xs),
      child: AppBar(
        backgroundColor: TColors.softGrey,
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Iconsax.arrow_left),
                color: dark ? TColors.white : TColors.dark)
            : leadingIcon != null
                ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon))
                : null,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const TCircleAvatarImage(backgroundImage: TImages.merchantLogo1),
                // TCircleAvatarImage(backgroundImage: merchantImage),
                // TCircularImage(image: TImages.merchantLogo1, height: TSizes.icosMd, width: TSizes.icosMd),
                const SizedBox(width: TSizes.spaceBtwItem),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(merchantName, style: Theme.of(context).textTheme.titleSmall),
                    Text('Online', style: Theme.of(context).textTheme.labelSmall),
                  ],
                )
              ],
            ),
            const SizedBox(height: TSizes.sm)
          ],
        ),
        actions: actions,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppbarHeight());
}
