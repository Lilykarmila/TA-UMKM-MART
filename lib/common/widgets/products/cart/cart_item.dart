import 'package:flutter/material.dart';

import '../../../../utils/constans/colors.dart';
import '../../../../utils/constans/image_strings.dart';
import '../../../../utils/constans/sizes.dart';
import '../../../../utils/helper/helper_functions.dart';
import '../../images/t_rounded_image.dart';
import '../../text/product_title_text.dart';
import '../../text/t_category_title_text_with_icon.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// image
        TRoundedImage(
          imageUrl: TImages.fashion3,
          width: 60,
          height: 60,
          padding: EdgeInsets.all(TSizes.sm),
          backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
        ),
        SizedBox(width: TSizes.spaceBtwItem),

        /// title, price, size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TMerchantWithIcon(title: 'Sweetstore'),
              Flexible(child: TProductTitleText(title: 'Kaos Hitam ', maxLines: 1)),

              /// attribut
              Text.rich(
                TextSpan(children: [
                  TextSpan(text: 'Color', style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(text: 'Green', style: Theme.of(context).textTheme.bodyLarge),
                  TextSpan(text: 'Size', style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(text: 'XL', style: Theme.of(context).textTheme.bodyLarge),
                ]),
              )
            ],
          ),
        )
      ],
    );
  }
}
