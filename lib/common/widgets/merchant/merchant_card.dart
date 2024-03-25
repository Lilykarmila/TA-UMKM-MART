import 'package:flutter/material.dart';
import 'package:ta_ecommerce/model/merchant_model.dart';
import 'package:ta_ecommerce/utils/helper/helper_functions.dart';

import '../images/t_circular_image.dart';
import '../products/rounded_container.dart';
import '../text/t_category_title_text_with_icon.dart';
import '../../../utils/constans/enums.dart';
import '../../../utils/constans/image_strings.dart';
import '../../../utils/constans/sizes.dart';

class TMerchantCard extends StatelessWidget {
  const TMerchantCard({
    super.key,
    required this.showBorder,
    this.onTap,
    required this.merchant,
  });

  final MerchantModel merchant;
  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: TRoundedContainer(
        padding: EdgeInsets.all(TSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// icon
            Flexible(
              child: TCircularImage(
                isNetworkImage: true,
                image: merchant.image,
                backgroundColor: Colors.transparent,
                // overlayColor: isDark ? Colors.white : TColors.black,
              ),
            ),
            SizedBox(width: TSizes.spaceBtwItem / 2),

            /// text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TMerchantWithIcon(title: merchant.name, brandTextSize: TextSizes.large),
                  // Text('20 produk', overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.labelMedium)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
