import 'package:flutter/material.dart';
import 'package:ta_ecommerce/model/merchant_model.dart';

import '../../../utils/constans/colors.dart';
import '../../../utils/constans/sizes.dart';
import '../../../utils/helper/helper_functions.dart';
import 'merchant_card.dart';
import '../products/rounded_container.dart';

class TMerchantShowCase extends StatelessWidget {
  const TMerchantShowCase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(TSizes.md),
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItem),
      child: Column(
        children: [
          /// brand with product count
          TMerchantCard(
            showBorder: false,
            merchant: MerchantModel.empty(),
          ),

          const SizedBox(height: TSizes.spaceBtwItem),

          /// brand top3 product images
          Row(children: images.map((image) => brandTopProductImageWidget(image, context)).toList())
        ],
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, context) {
  return Expanded(
    child: TRoundedContainer(
      height: 100,
      padding: const EdgeInsets.all(TSizes.md),
      margin: const EdgeInsets.only(right: TSizes.sm),
      backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
      child: Image(fit: BoxFit.contain, image: AssetImage(image)),
    ),
  );
}
