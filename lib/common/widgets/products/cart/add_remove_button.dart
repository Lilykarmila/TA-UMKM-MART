import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constans/colors.dart';
import '../../../../utils/constans/sizes.dart';
import '../../../../utils/helper/helper_functions.dart';
import '../../icons/t_circular_icon.dart';

class TProductQuantityButton extends StatelessWidget {
  const TProductQuantityButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: THelperFunctions.isDarkMode(context) ? TColors.white : TColors.black,
          backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
        ),
        SizedBox(width: TSizes.spaceBtwItem),
        Text('2', style: Theme.of(context).textTheme.titleSmall),
        SizedBox(width: TSizes.spaceBtwItem),
        TCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: TColors.white,
          backgroundColor: TColors.primaryColor,
        ),
      ],
    );
  }
}
