import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_ecommerce/common/widgets/loaders/vertical_product_shimmer.dart';
import 'package:ta_ecommerce/controller/product_controller/product_controller.dart';
import 'package:ta_ecommerce/utils/constans/image_strings.dart';
import 'package:ta_ecommerce/utils/constans/sizes.dart';
import 'package:ta_ecommerce/view/screens/all_products/all_product.dart';
import 'package:ta_ecommerce/view/screens/home/widget/home_appbar.dart';
import '../../../common/widgets/custom_shape/primary_header_container.dart';
import '../../../common/widgets/custom_shape/search_container.dart';
import '../../../common/widgets/layouts/grid_layout.dart';
import '../../../common/widgets/products/product_card_vertical.dart';
import '../../../common/widgets/text/section_heading.dart';
import 'widget/home_categories.dart';
import 'widget/promo_slider.dart';

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
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// appbar
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  /// searchbar
                  TSearchContainer(text: 'Cari'),
                  SizedBox(height: TSizes.spaceBtwSections),

                  /// category
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
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

                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            /// body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// Promo slider
                  // TPromoSlider(banners: [TImages.banner2, TImages.banner3, TImages.banner2]),
                  // SizedBox(height: TSizes.spaceBtwSections),

                  /// Heading
                  TSectionHeading(
                      title: 'Produk UMKM',
                      onPressed: () => Get.to(() => AllProductsScreen(
                            title: 'Semua Produk UMKM',
                            futureMethod: controller.fetchAllFeaturedProducts(),
                          ))),
                  SizedBox(height: TSizes.spaceBtwItem),

                  /// Popular Product

                  Obx(() {
                    if (controller.isLoading.value) return TVerticalProductShimmer();
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
