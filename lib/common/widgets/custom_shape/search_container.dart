// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
//
// import '../../../utils/constans/colors.dart';
// import '../../../utils/constans/sizes.dart';
// import '../../../utils/devices/devices_utility.dart';
// import '../../../utils/helper/helper_functions.dart';
//
// class TSearchContainer extends StatelessWidget {
//   const TSearchContainer({
//     super.key,
//     required this.text,
//     this.icon = Iconsax.search_normal,
//     this.showBackground = true,
//     this.showBorder = true,
//     this.ontap,
//     this.padding = const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
//   });
//   final String text;
//   final IconData? icon;
//   final bool showBackground, showBorder;
//   final VoidCallback? ontap;
//   final EdgeInsetsGeometry padding;
//
//   @override
//   Widget build(BuildContext context) {
//     final dark = THelperFunctions.isDarkMode(context);
//     return GestureDetector(
//       onTap: ontap,
//       child: Padding(
//         padding: padding,
//         child: Container(
//           width: TDeviceUtils.getScreenWidth(context),
//           padding: EdgeInsets.all(TSizes.md),
//           decoration: BoxDecoration(
//             color: showBackground
//                 ? dark
//                     ? TColors.dark
//                     : TColors.light
//                 : Colors.transparent,
//             borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
//             border: showBorder ? Border.all(color: TColors.grey) : null,
//           ),
//           child: Row(
//             children: [
//               Icon(icon, color: TColors.darkerGrey),
//               SizedBox(width: TSizes.spaceBtwItem),
//               Expanded(
//                 child: TextField(
//                   decoration: InputDecoration(
//                     hintText: text,
//                     border: InputBorder.none,
//                   ),
//                   onChanged: (value) {
//                     // Handle changes here
//                     print(value);
//                   },
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

///-----
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart'; // Import Get for GetX functionality

import '../../../utils/constans/colors.dart';
import '../../../utils/constans/sizes.dart';
import '../../../utils/devices/devices_utility.dart';
import '../../../utils/helper/helper_functions.dart';
import '../../../controller/product_controller/product_controller.dart'; // Import your product controller

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    Key? key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.padding = const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
  }) : super(key: key);

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final productController = Get.find<ProductController>(); // Get the product controller

    return GestureDetector(
      onTap: () {
        // You can navigate to the search results page or do something else here
        print("Search for: $text");

        // Fetch products by name using productController
        productController.fetchProductsByName(text);
      },
      child: Container(
        width: double.infinity,
        padding: padding,
        decoration: BoxDecoration(
          color: showBackground
              ? dark
                  ? TColors.dark
                  : TColors.light
              : Colors.transparent,
          borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
          border: showBorder ? Border.all(color: TColors.grey) : null,
        ),
        child: Row(
          children: [
            Icon(icon, color: TColors.darkerGrey),
            SizedBox(width: TSizes.spaceBtwItem),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: text,
                  hintStyle: TextStyle(color: TColors.darkerGrey),
                  border: InputBorder.none,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: TColors.primaryColor),
                  ),
                ),
                onChanged: (value) {
                  // Handle changes here
                  print(value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
