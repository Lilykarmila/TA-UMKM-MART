// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ta_ecommerce/common/widgets/appbar/appbar.dart';
// import 'package:ta_ecommerce/common/widgets/custom_shape/search_container.dart';
// import 'package:ta_ecommerce/common/widgets/layouts/grid_layout.dart';
// import 'package:ta_ecommerce/common/widgets/loaders/merchant_shimmer.dart';
// import 'package:ta_ecommerce/common/widgets/products/cart/cart_menu_icon.dart';
// import 'package:ta_ecommerce/common/widgets/text/section_heading.dart';
// import 'package:ta_ecommerce/controller/category_controller.dart';
// import 'package:ta_ecommerce/controller/merchant_controller/merchant_controller.dart';
// import 'package:ta_ecommerce/utils/constans/colors.dart';
// import 'package:ta_ecommerce/utils/constans/sizes.dart';
// import 'package:ta_ecommerce/utils/helper/helper_functions.dart';
//
// import '../../../common/widgets/appbar/tabbar.dart';
// import '../../../common/widgets/merchant/merchant_card.dart';
// import '../merchant/all_merchant.dart';
// import '../merchant/merchant_products.dart';
// import 'widget/category_tab.dart';
//
// class StoreScreen extends StatelessWidget {
//   const StoreScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final merchantController = Get.put(MerchantController());
//     final categories = CategoryController.instance.featuredCategories;
//     return DefaultTabController(
//       length: categories.length,
//       child: Scaffold(
//         appBar: TAppBar(
//           title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
//           // actions: [
//           //   /// cart
//           //   TCardCounterIcon(
//           //     onPressed: () {},
//           //   )
//           // ],
//         ),
//         body: NestedScrollView(
//           headerSliverBuilder: (_, innerBoxIsScrolled) {
//             return [
//               SliverAppBar(
//                 automaticallyImplyLeading: false,
//                 pinned: true,
//                 floating: true,
//                 backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,
//                 expandedHeight: 440,
//                 flexibleSpace: Padding(
//                   padding: EdgeInsets.all(TSizes.defaultSpace),
//                   child: ListView(
//                     shrinkWrap: true,
//                     physics: NeverScrollableScrollPhysics(),
//                     children: [
//                       /// search bar
//                       // SizedBox(height: TSizes.spaceBtwItem),
//                       // TSearchContainer(
//                       //     text: ' Search in Store', showBorder: true, showBackground: false, padding: EdgeInsets.zero),
//                       // SizedBox(height: TSizes.spaceBtwSections),
//
//                       /// featured merchant
//                       TSectionHeading(title: 'Featured Merchant', onPressed: () => Get.to(() => AllMerchantScreen())),
//                       SizedBox(height: TSizes.spaceBtwItem),
//
//                       /// Merchant GRID
//                       Obx(
//                         () {
//                           if (merchantController.isLoading.value) return const TMerchantShimmer();
//                           if (merchantController.featuredMerchants.isEmpty) {
//                             return Center(
//                                 child: Text('Data Tidak Ditemukan!',
//                                     style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
//                           }
//
//                           return TGridLayout(
//                               itemCount: merchantController.featuredMerchants.length,
//                               mainAxisExtend: 80,
//                               itemBuilder: (_, index) {
//                                 final merchant = merchantController.featuredMerchants[index];
//                                 return TMerchantCard(
//                                   merchant: merchant,
//                                   showBorder: true,
//                                   onTap: () => Get.to(() => MerchantProducts(merchant: merchant)),
//                                 );
//                               });
//                         },
//                       )
//                     ],
//                   ),
//                 ),
//
//                 /// tabs
//                 bottom: TTabBar(
//                   tabs: categories.map((category) => Tab(child: Text(category.name))).toList(),
//                 ),
//               )
//             ];
//           },
//
//           /// body
//           body: TabBarView(
//             children: categories.map((category) => TCategoryTab(category: category)).toList(),
//           ),
//         ),
//       ),
//     );
//   }
// }
/// ------------ ///
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ta_ecommerce/common/widgets/appbar/appbar.dart';
// import 'package:ta_ecommerce/common/widgets/custom_shape/search_container.dart';
// import 'package:ta_ecommerce/common/widgets/layouts/grid_layout.dart';
// import 'package:ta_ecommerce/common/widgets/loaders/merchant_shimmer.dart';
// import 'package:ta_ecommerce/common/widgets/products/cart/cart_menu_icon.dart';
// import 'package:ta_ecommerce/common/widgets/text/section_heading.dart';
// import 'package:ta_ecommerce/controller/category_controller.dart';
// import 'package:ta_ecommerce/controller/merchant_controller/merchant_controller.dart';
// import 'package:ta_ecommerce/utils/constans/colors.dart';
// import 'package:ta_ecommerce/utils/constans/sizes.dart';
// import 'package:ta_ecommerce/utils/helper/helper_functions.dart';
//
// import '../../../common/widgets/appbar/tabbar.dart';
// import '../../../common/widgets/merchant/merchant_card.dart';
// import '../merchant/all_merchant.dart';
// import '../merchant/merchant_products.dart';
// import 'widget/category_tab.dart';
//
// class StoreScreen extends StatelessWidget {
//   const StoreScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final merchantController = Get.put(MerchantController());
//     final categories = CategoryController.instance.featuredCategories;
//     return DefaultTabController(
//       length: categories.length,
//       child: Scaffold(
//         appBar: TAppBar(
//           title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
//           // actions: [
//           //   /// cart
//           //   TCardCounterIcon(
//           //     onPressed: () {},
//           //   )
//
//           // ],
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: ListView(
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             children: [
//               /// search bar
//               // SizedBox(height: TSizes.spaceBtwItem),
//               // TSearchContainer(
//               //     text: ' Search in Store', showBorder: true, showBackground: false, padding: EdgeInsets.zero),
//               // SizedBox(height: TSizes.spaceBtwSections),
//
//               /// featured merchant
//               TSectionHeading(title: 'Featured Merchant', onPressed: () => Get.to(() => AllMerchantScreen())),
//               SizedBox(height: TSizes.spaceBtwItem),
//
//               /// Merchant GRID
//               Obx(
//                 () {
//                   if (merchantController.isLoading.value) return const TMerchantShimmer();
//                   if (merchantController.allMerchants.isEmpty) {
//                     return Center(
//                         child: Text('Data Tidak Ditemukan!',
//                             style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
//                   }
//
//                   return TGridLayout(
//                       itemCount: merchantController.allMerchants.length,
//                       mainAxisExtend: 80,
//                       itemBuilder: (_, index) {
//                         final merchant = merchantController.allMerchants[index];
//                         print("Merchant : " + merchant.id);
//                         return TMerchantCard(
//                           merchant: merchant,
//                           showBorder: true,
//                           onTap: () => Get.to(() => MerchantProducts(merchant: merchant)),
//                         );
//                       });
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
/// --------------- //
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ta_ecommerce/common/widgets/custom_shape/search_container.dart';
import 'package:ta_ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:ta_ecommerce/common/widgets/loaders/merchant_shimmer.dart';
import 'package:ta_ecommerce/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:ta_ecommerce/common/widgets/text/section_heading.dart';
import 'package:ta_ecommerce/controller/category_controller.dart';
import 'package:ta_ecommerce/controller/merchant_controller/merchant_controller.dart';
import 'package:ta_ecommerce/utils/constans/colors.dart';
import 'package:ta_ecommerce/utils/constans/sizes.dart';
import 'package:ta_ecommerce/utils/helper/helper_functions.dart';

import '../../../common/widgets/appbar/tabbar.dart';
import '../../../common/widgets/merchant/merchant_card.dart';
import '../merchant/all_merchant.dart';
import '../merchant/merchant_products.dart';
import 'widget/category_tab.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final merchantController = Get.put(MerchantController());
    final categories = CategoryController.instance.featuredCategories;
    return Scaffold(
      appBar: TAppBar(
        title: Text('Toko', style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
        child: ListView(
          children: [
            /// featured merchant
            // TSectionHeading(title: 'UMKM', onPressed: () => Get.to(() => AllMerchantScreen())),
            SizedBox(height: TSizes.spaceBtwItem),

            /// Merchant GRID
            Obx(
              () {
                if (merchantController.isLoading.value) return const TMerchantShimmer();
                if (merchantController.allMerchants.isEmpty) {
                  return Center(
                      child: Text('Data Tidak Ditemukan!',
                          style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
                }

                return GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3.5 / 2.5,
                    crossAxisSpacing: 10, // Spasi horizontal antar grid
                    mainAxisSpacing: 10, // 150 x 100
                  ),
                  itemCount: merchantController.allMerchants.length,
                  itemBuilder: (_, index) {
                    final merchant = merchantController.allMerchants[index];
                    print("Merchant : " + merchant.id);
                    return TMerchantCard(
                      merchant: merchant,
                      showBorder: true,
                      onTap: () => Get.to(() => MerchantProducts(merchant: merchant)),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
