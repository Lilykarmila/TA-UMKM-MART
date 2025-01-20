import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_ecommerce/common/widgets/text/section_heading.dart';
import 'package:ta_ecommerce/utils/constans/sizes.dart';

import '../../../common/widgets/appbar/appbar.dart';
import '../../../common/widgets/layouts/grid_layout.dart';
import '../../../common/widgets/loaders/vertical_product_shimmer.dart';
import '../../../common/widgets/products/product_card_vertical.dart';
import '../../../controller/product_controller/product_controller.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      appBar: const TAppBar(title: Text('Kuliner'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// sub categories
              Column(
                children: [
                  /// heading
                  TSectionHeading(title: 'Kuliner daerah', onPressed: () {}),
                  const SizedBox(height: TSizes.spaceBtwItem / 2),

                  /// product card

                  Obx(() {
                    if (controller.isLoading.value) return const TVerticalProductShimmer();
                    if (controller.featuredProducts.isEmpty) {
                      return Center(
                          child: Text('Data tidak ditemukan!', style: Theme.of(context).textTheme.bodyMedium));
                    }
                    return TGridLayout(
                      itemCount: controller.featuredProducts.length,
                      itemBuilder: (_, index) => TProductCardVertical(product: controller.featuredProducts[index]),
                    );
                  })
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItem),
            ],
          ),
        ),
      ),
    );
  }
}
