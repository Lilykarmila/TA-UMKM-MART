import 'package:flutter/material.dart';
import 'package:ta_ecommerce/model/category_model.dart';

import '../../../../utils/constans/sizes.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// brand
              // TMerchantShowCase(images: [TImages.fashion2, TImages.fashion1, TImages.fashion2]),
              // TMerchantShowCase(images: [TImages.fashion2, TImages.fashion1, TImages.fashion2]),

              SizedBox(height: TSizes.spaceBtwItem),

              ///  product
              // TSectionHeading(title: 'Kamu mungkin suka', showActionButton: true, onPressed: () {}),
              // SizedBox(height: TSizes.spaceBtwItem),
              //
              // TGridLayout(itemCount: 4, itemBuilder: (_, index) => TProductCardVertical(product: ProductModel.empty()))
            ],
          ),
        ),
      ],
    );
  }
}
