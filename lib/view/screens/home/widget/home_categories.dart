import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_ecommerce/common/widgets/loaders/category_shimmer.dart';
import 'package:ta_ecommerce/controller/category_controller.dart';
import 'package:ta_ecommerce/view/screens/sub_category/sub_categories.dart';

import '../../../../common/widgets/image_text_widget/vertical_image_text.dart';
import '../../../../utils/constans/image_strings.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Obx(() {
      if (categoryController.isLoading.value) return TCategoryShimmer();
      if (categoryController.featuredCategories.isEmpty) {
        return Center(
            child: Text('Data tidak ditemukan',
                style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
      }
      return SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryController.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = categoryController.featuredCategories[index];
            return TVerticaImageText(
                image: category.image, title: category.name, onTap: () => Get.to(() => SubCategoriesScreen()));
          },
        ),
      );
    });
  }
}
