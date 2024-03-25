import 'package:flutter/material.dart';

import '../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../common/widgets/text/product_price_text.dart';
import '../../../../utils/constans/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddRemoveButton = true,
  });

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => SizedBox(height: TSizes.spaceBtwSections),
      itemCount: 2,
      itemBuilder: (_, index) => Column(
        children: [
          /// cart item
          TCartItem(),
          if (showAddRemoveButton) SizedBox(height: TSizes.spaceBtwItem),

          /// add remove button with total price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (showAddRemoveButton)
                Row(
                  children: [
                    SizedBox(width: 70),

                    /// add and remove button
                    TProductQuantityButton(),
                  ],
                ),

              /// total price
              TProductPriceText(price: '230'),
            ],
          )
        ],
      ),
    );
  }
}
