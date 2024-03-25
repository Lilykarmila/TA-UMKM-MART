import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ta_ecommerce/common/widgets/images/t_rounded_image.dart';
import 'package:ta_ecommerce/common/widgets/products/rounded_container.dart';
import 'package:ta_ecommerce/common/widgets/text/product_price_text.dart';
import 'package:ta_ecommerce/common/widgets/text/product_title_text.dart';
import 'package:ta_ecommerce/common/widgets/text/t_category_title_text_with_icon.dart';
import 'package:ta_ecommerce/utils/constans/image_strings.dart';
import 'package:ta_ecommerce/utils/helper/helper_functions.dart';

import '../../../utils/constans/colors.dart';
import '../../../utils/constans/sizes.dart';
import '../icons/t_circular_icon.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        // boxShadow: [TShadowStyle.verticalProductShadow],
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: dark ? TColors.darkerGrey : TColors.softGrey,
      ),
      child: Row(
        children: [
          /// thumbnail
          TRoundedContainer(
            height: 120,
            padding: EdgeInsets.all(TSizes.sm),
            backgroundColor: dark ? TColors.dark : TColors.light,
            child: Stack(
              children: [
                /// thumbnail image
                SizedBox(
                  height: 120,
                  width: 120,
                  child: TRoundedImage(imageUrl: TImages.fashion3, applyImageRadius: true),
                ),

                /// sale tag
                Positioned(
                  top: 12,
                  child: TRoundedContainer(
                    radius: TSizes.sm,
                    backgroundColor: TColors.secondary.withOpacity(0.8),
                    padding: EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
                    child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black)),
                  ),
                ),

                /// favorit button
                // Positioned(
                //   top: 0,
                //   right: 0,
                //   child: TCircularIcon(icon: Iconsax.heart5, color: Colors.red),
                // ),
              ],
            ),
          ),

          /// detail
          SizedBox(
            width: 172,
            child: Padding(
              padding: EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTitleText(title: 'Kemeja wanita Kekinian', smallSize: true),
                      SizedBox(height: TSizes.spaceBtwItem / 2),
                      TMerchantWithIcon(title: 'Sweetstore'),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ///ppricing
                      Flexible(child: TProductPriceText(price: '558-87203')),

                      /// add to cart button
                      Container(
                        decoration: BoxDecoration(
                          color: TColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSizes.cardRadiusMd),
                            bottomRight: Radius.circular(TSizes.cardRadiusMd),
                          ),
                        ),
                        child: SizedBox(
                          width: TSizes.icosLg * 1.2,
                          height: TSizes.icosLg * 1.2,
                          child: Center(child: Icon(Iconsax.add, color: TColors.white)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
