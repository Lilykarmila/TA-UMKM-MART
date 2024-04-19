import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ta_ecommerce/common/styles/shadow_style.dart';
import 'package:ta_ecommerce/common/widgets/images/t_rounded_image.dart';
import 'package:ta_ecommerce/common/widgets/products/rounded_container.dart';
import 'package:ta_ecommerce/common/widgets/text/product_title_text.dart';
import 'package:ta_ecommerce/common/widgets/text/t_category_title_text_with_icon.dart';
import 'package:ta_ecommerce/controller/product_controller/product_controller.dart';
import 'package:ta_ecommerce/model/product_model.dart';
import 'package:ta_ecommerce/utils/constans/colors.dart';
import 'package:ta_ecommerce/utils/constans/image_strings.dart';
import 'package:ta_ecommerce/utils/constans/sizes.dart';
import 'package:ta_ecommerce/utils/helper/helper_functions.dart';

import '../../../view/screens/all_products/product_details/product_detail.dart';
import '../icons/t_circular_icon.dart';
import '../text/product_price_text.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({Key? key, required this.product}) : super(key: key);

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product)),
      child: Container(
        width: 180,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Thumbnail, wishlist, button, discount tag
            TRoundedContainer(
              height: 180,
              width: 180,

              // padding: EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Center(
                  child: TRoundedImage(imageUrl: product.thumbnail, applyImageRadius: true, isNetworkImage: true)),
            ),
            SizedBox(height: TSizes.spaceBtwItem / 2),

            /// Details
            Padding(
              padding: EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(title: product.title, smallSize: true),
                  SizedBox(height: TSizes.spaceBtwItem / 2),
                  TMerchantWithIcon(title: product.merchant!.name),
                ],
              ),
            ),

            /// spacer() agar tinggi card tetap sama walau ada judul yang memiliki 2 baris
            Spacer(),

            /// Price Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// price
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(left: TSizes.sm),
                    child: TProductPriceText(price: controller.getProductPrice(product)),
                  ),
                ),
                SizedBox(height: 50)

                /// add to cart button
                // Container(
                //   decoration: const BoxDecoration(
                //     color: TColors.dark,
                //     borderRadius: BorderRadius.only(
                //       topLeft: Radius.circular(TSizes.cardRadiusMd),
                //       bottomRight: Radius.circular(TSizes.cardRadiusMd),
                //     ),
                //   ),
                //   child: SizedBox(
                //     width: TSizes.icosLg * 1.2,
                //     height: TSizes.icosLg * 1.2,
                //     child: Center(child: Icon(Iconsax.add, color: TColors.white)),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
