import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ta_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ta_ecommerce/common/widgets/icons/t_circular_icon.dart';
import 'package:ta_ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:ta_ecommerce/common/widgets/products/product_card_vertical.dart';
import 'package:ta_ecommerce/model/product_model.dart';
import 'package:ta_ecommerce/navigation_menu.dart';
import 'package:ta_ecommerce/utils/constans/sizes.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          TCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(NavigationMenu()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TGridLayout(itemCount: 6, itemBuilder: (_, index) => TProductCardVertical(product: ProductModel.empty()))
            ],
          ),
        ),
      ),
    );
  }
}
