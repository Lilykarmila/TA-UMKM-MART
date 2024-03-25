import 'package:flutter/material.dart';
import 'package:ta_ecommerce/common/widgets/images/t_circular_image.dart';
import 'package:ta_ecommerce/common/widgets/products/rounded_container.dart';
import 'package:ta_ecommerce/common/widgets/text/product_price_text.dart';
import 'package:ta_ecommerce/common/widgets/text/product_title_text.dart';
import 'package:ta_ecommerce/common/widgets/text/t_category_title_text_with_icon.dart';
import 'package:ta_ecommerce/controller/product_controller/product_controller.dart';
import 'package:ta_ecommerce/model/product_model.dart';
import 'package:ta_ecommerce/utils/constans/enums.dart';
import 'package:ta_ecommerce/utils/constans/image_strings.dart';
import 'package:ta_ecommerce/utils/helper/helper_functions.dart';

import '../../../../../utils/constans/sizes.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({Key? key, required this.product}) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final darkMode = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// price
        TProductPriceText(price: controller.getProductPrice(product), isLarge: true),
        SizedBox(width: TSizes.spaceBtwItem / 1.5),

        /// title
        TProductTitleText(title: product.title),
        SizedBox(width: TSizes.spaceBtwItem / 1.5),

        // Row(
        //   children: [
        //     /// sale tag
        //     TRoundedContainer(
        //       radius: TSizes.sm,
        //       backgroundColor: TColors.secondary.withOpacity(0.8),
        //       padding: EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
        //       child: Text(
        //         '25%',
        //         style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),
        //       ),
        //     ),
        //     SizedBox(width: TSizes.spaceBtwItem),
        //
        //     /// price
        //     Text('\IDR  35k',
        //         style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
        //
        //     SizedBox(width: TSizes.spaceBtwItem),
        //   ],
        // ),
        // SizedBox(width: TSizes.spaceBtwItem / 1.5),
        //
        // // stack status
        // Row(
        //   children: [
        //     TProductTitleText(title: 'Status'),
        //     SizedBox(width: TSizes.spaceBtwItem),
        //     Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
        //   ],
        // ),
        // SizedBox(width: TSizes.spaceBtwItem / 1.5),

        /// brand
        Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TCircularImage(
              height: 32,
              width: 32,
              fit: BoxFit.fitWidth,
              image: product.merchant != null ? product.merchant!.image : TImages.merchantDefaultLogo,
            ),
            TMerchantWithIcon(
                title: product.merchant != null ? product.merchant!.name : '', brandTextSize: TextSizes.medium),
          ],
        )
      ],
    );
  }
}
