import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ta_ecommerce/common/widgets/custom_shape/search_container.dart';
import 'package:ta_ecommerce/common/widgets/loaders/vertical_product_shimmer.dart';
import 'package:ta_ecommerce/utils/constans/sizes.dart';
import 'package:ta_ecommerce/utils/helper/cloud_helper_functions.dart';

import '../../../common/widgets/products/sortable_products.dart';
import '../../../controller/product_controller/all_products_controller.dart';
import '../../../model/product_model.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({Key? key, required this.title, this.query, this.futureMethod}) : super(key: key);

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;
  @override
  Widget build(BuildContext context) {
    // initialize controller for managing product fetching
    final controller = Get.put(AllProductsController());

    return Scaffold(
      appBar: TAppBar(title: Text(title), showBackArrow: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            TSearchContainer(
              text: 'Cari',
            ),
            SizedBox(height: TSizes.spaceBtwSections),
            FutureBuilder(
                future: futureMethod ?? controller.fetchProductByQuery(query),
                builder: (context, snapshot) {
                  // check the state of the FutureBuilder snapshot
                  const loader = TVerticalProductShimmer();
                  final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);

                  // return approiate widget based on snapshot state
                  if (widget != null) return widget;

                  // product found!
                  final products = snapshot.data!;

                  return TSortableProducts(products: products);
                }),
          ],
        ),
      ),
    );
  }
}
