import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:ta_ecommerce/common/widgets/text/section_heading.dart';
import 'package:ta_ecommerce/model/product_model.dart';
import 'package:ta_ecommerce/utils/constans/sizes.dart';
import 'package:ta_ecommerce/utils/helper/helper_functions.dart';

import '../../../chat/widget/chat_room.dart';
import 'widget/product_detail_image_slider.dart';
import 'widget/product_meta_data.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key, required this.product}) : super(key: key);

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      // bottomNavigationBar: TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// product image slider
            TProductImageSlider(product: product),

            /// product details
            Padding(
              padding:
                  const EdgeInsets.only(right: TSizes.defaultSpace, left: TSizes.defaultSpace, bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  /// rating & share
                  // TRatingAndShare(),
                  // SizedBox(height: TSizes.spaceBtwItem),

                  /// price, title, stack & brand
                  TProductMetaData(product: product),
                  const SizedBox(height: TSizes.spaceBtwItem),

                  /// attribut
                  // TProductAttributes(),
                  // SizedBox(height: TSizes.spaceBtwSections),

                  /// checkout button
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: const Text('Checkout'))),

                  const SizedBox(height: TSizes.spaceBtwItem),
                  SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                          onPressed: () => Get.to(ChatRoomPage(
                                merchantId: product.merchant!.id,
                                merchantName: product.merchant!.name,
                                merchantImage: product.merchant!.image,
                                merchantType: product.merchant!.type,
                                // merchantType: product.merchant!.type.toString(),
                              )),
                          child: const Text('Chat Sekarang'))),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// description
                  const TSectionHeading(title: 'Deskripsi', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItem),

                  ReadMoreText(
                    product.description ?? '',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show More',
                    trimExpandedText: '  Less',
                    moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  /// reviews
                  ///
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItem),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     TSectionHeading(title: 'Reviews (134)', showActionButton: false),
                  //     IconButton(
                  //         icon: Icon(Iconsax.arrow_right_3, size: 18),
                  //         onPressed: () => Get.to(() => ProductReviewScreen())),
                  //   ],
                  // ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
