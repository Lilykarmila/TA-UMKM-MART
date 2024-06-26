import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_ecommerce/controller/home_controller.dart';
import 'package:ta_ecommerce/utils/constans/colors.dart';

import '../../../../common/widgets/custom_shape/circular_containers.dart';
import '../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../utils/constans/sizes.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
          items: banners.map((url) => TRoundedImage(imageUrl: url)).toList(),
        ),
        SizedBox(height: TSizes.spaceBtwItem),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                  TCircularContainer(
                      width: 20,
                      height: 4,
                      margin: EdgeInsets.only(right: 10),
                      backgroundColor:
                          controller.carouselCurrentIndex.value == i ? TColors.primaryColor : TColors.grey),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
