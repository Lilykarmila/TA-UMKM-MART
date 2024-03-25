import 'package:flutter/material.dart';
import 'package:ta_ecommerce/common/widgets/images/t_rounded_image.dart';
import 'package:ta_ecommerce/common/widgets/products/product_card_horizontal.dart';
import 'package:ta_ecommerce/common/widgets/text/section_heading.dart';
import 'package:ta_ecommerce/utils/constans/image_strings.dart';
import 'package:ta_ecommerce/utils/constans/sizes.dart';

import '../../../common/widgets/appbar/appbar.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('Kuliner'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// banner
              TRoundedImage(width: double.infinity, imageUrl: TImages.banner2, applyImageRadius: true),
              SizedBox(height: TSizes.spaceBtwSections),

              /// sub categories
              Column(
                children: [
                  /// heading
                  TSectionHeading(title: 'Kuliner daerah', onPressed: () {}),
                  SizedBox(height: TSizes.spaceBtwItem / 2),

                  /// product card

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => SizedBox(width: TSizes.spaceBtwItem),
                      itemBuilder: (context, index) => TProductCardHorizontal(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: TSizes.spaceBtwItem),

              Column(
                children: [
                  /// heading
                  TSectionHeading(title: 'Kuliner daerah', onPressed: () {}),
                  SizedBox(height: TSizes.spaceBtwItem / 2),

                  /// product card

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => SizedBox(width: TSizes.spaceBtwItem),
                      itemBuilder: (context, index) => TProductCardHorizontal(),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
