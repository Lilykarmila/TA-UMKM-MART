import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ta_ecommerce/controller/product_controller/images_controller.dart';
import 'package:ta_ecommerce/model/product_model.dart';
import 'package:ta_ecommerce/utils/helper/helper_functions.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shape/curved_edges_widget.dart';
import '../../../../../common/widgets/icons/t_circular_icon.dart';
import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../utils/constans/colors.dart';
import '../../../../../utils/constans/image_strings.dart';
import '../../../../../utils/constans/sizes.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);
    return TCurvedEdgeWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            /// Main large image
            SizedBox(
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Center(child: Obx(() {
                    final image = controller.selectedProductImage.value;

                    return GestureDetector(
                      onTap: () {},
                      // onTap: () => controller.showEnlargedImage(image),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (_, __, downloadProgress) =>
                            CircularProgressIndicator(value: downloadProgress.progress, color: TColors.primaryColor),
                      ),
                    );
                  })),
                )),

            /// image slider
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => SizedBox(width: TSizes.spaceBtwItem),
                  itemBuilder: (_, index) => Obx(
                    () {
                      final imageSelected = controller.selectedProductImage.value == images[index];
                      return TRoundedImage(
                        width: 80,
                        isNetworkImage: true,
                        imageUrl: images[index],
                        backgroundColor: dark ? TColors.darkerGrey : TColors.white,
                        onPressed: () => controller.selectedProductImage.value = images[index],
                        border: Border.all(color: imageSelected ? TColors.primaryColor : Colors.transparent),
                        padding: EdgeInsets.all(2),
                      );
                    },
                  ),
                ),
              ),
            ),

            /// Appbar icons
            TAppBar(
              showBackArrow: true,
              // actions: [TCircularIcon(icon: Iconsax.heart5, color: Colors.red)],
            )
          ],
        ),
      ),
    );
  }
}
