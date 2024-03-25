import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ta_ecommerce/common/widgets/images/t_circle_avatar_images.dart';

import '../../../common/widgets/images/t_circular_image.dart';
import '../../../utils/constans/colors.dart';
import '../../../utils/constans/image_strings.dart';
import '../../../utils/constans/sizes.dart';
import '../../../utils/devices/devices_utility.dart';
import '../../../utils/helper/helper_functions.dart';

class THeaderChat extends StatelessWidget implements PreferredSizeWidget {
  THeaderChat({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed,
    required this.merchantName,
    required this.merchantImage
  });

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
      padding: EdgeInsets.symmetric(horizontal: TSizes.xs),
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
                TCircleAvatarImage(backgroundImage: merchantImage),
                // TCircularImage(image: TImages.merchantLogo1, height: TSizes.icosMd, width: TSizes.icosMd),
                SizedBox(width: TSizes.spaceBtwItem),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(merchantName, style: Theme.of(context).textTheme.titleSmall),
                    Text('Online', style: Theme.of(context).textTheme.labelSmall),
                  ],
                )
              ],
            ),
            SizedBox(height: TSizes.sm)
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
