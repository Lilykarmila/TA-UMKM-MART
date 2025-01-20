import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_ecommerce/common/widgets/loaders/vertical_product_shimmer.dart';
import 'package:ta_ecommerce/controller/product_controller/product_controller.dart';
import 'package:ta_ecommerce/utils/constans/sizes.dart';
import 'package:ta_ecommerce/view/screens/all_products/all_product.dart';
import 'package:ta_ecommerce/view/screens/home/widget/home_appbar.dart';
import '../../../common/widgets/custom_shape/primary_header_container.dart';
import '../../../common/widgets/custom_shape/search_container.dart';
import '../../../common/widgets/layouts/grid_layout.dart';
import '../../../common/widgets/products/product_card_vertical.dart';
import '../../../common/widgets/text/section_heading.dart';
import 'widget/home_categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      // appBar: Padding(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// appbar
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwItem),

                  /// searchbar
                  Container(child: TSearchContainer(text: 'Cari')),
                  SizedBox(height: TSizes.spaceBtwItem),

                  /// category
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        /// heading
                        TSectionHeading(title: 'Popular Categories', showActionButton: false, textColor: Colors.white),
                        SizedBox(height: TSizes.spaceBtwItem),

                        ///categories
                        THomeCategories()
                      ],
                    ),
                  ),

                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            /// body
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  /// Heading
                  TSectionHeading(
                      title: 'Produk UMKM',
                      onPressed: () => Get.to(() => AllProductsScreen(
                            title: 'Semua Produk UMKM',
                            futureMethod: controller.fetchAllFeaturedProducts(),
                          ))),

                  /// Popular Product

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
            ),
          ],
        ),
      ),
    );
  }
}
