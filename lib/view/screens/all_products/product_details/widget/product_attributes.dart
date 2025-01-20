import 'package:flutter/material.dart';
import 'package:ta_ecommerce/common/widgets/products/rounded_container.dart';
import 'package:ta_ecommerce/common/widgets/text/product_price_text.dart';
import 'package:ta_ecommerce/common/widgets/text/product_title_text.dart';
import 'package:ta_ecommerce/common/widgets/text/section_heading.dart';
import 'package:ta_ecommerce/utils/constans/colors.dart';
import 'package:ta_ecommerce/utils/constans/sizes.dart';
import 'package:ta_ecommerce/utils/helper/helper_functions.dart';

import '../../../../../common/widgets/chips/choice_chips.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        /// selected attribut pricing description
        TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Column(
            children: [
              /// title, price, stack status
              Row(
                children: [
                  const TSectionHeading(title: 'Variasi', showActionButton: false),
                  const SizedBox(width: TSizes.spaceBtwItem),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const TProductTitleText(title: 'Price', smallSize: true),

                          /// actual price
                          Text('IDR 35k',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .apply(decoration: TextDecoration.lineThrough)),

                          const SizedBox(width: TSizes.spaceBtwItem),

                          /// sale price
                          const TProductPriceText(price: '20')
                        ],
                      ),

                      /// stock
                      Row(
                        children: [
                          const TProductTitleText(title: 'Stock', smallSize: true),
                          Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
                        ],
                      )
                    ],
                  ),
                ],
              ),

              /// description
              const TProductTitleText(
                title: 'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s',
                smallSize: true,
                maxLines: 4,
              )
            ],
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItem),

        /// arrtibut
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Colors', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItem / 2),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'Green', selected: true, onSelected: (value) {}),
                TChoiceChip(text: 'Blue', selected: false, onSelected: (value) {}),
                TChoiceChip(text: 'Yellow', selected: false, onSelected: (value) {}),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Size'),
            const SizedBox(height: TSizes.spaceBtwItem / 2),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: '39', selected: true, onSelected: (value) {}),
                TChoiceChip(text: '40', selected: false, onSelected: (value) {}),
                TChoiceChip(text: '41', selected: false, onSelected: (value) {}),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
