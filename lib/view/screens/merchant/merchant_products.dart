import 'package:flutter/material.dart';
import 'package:ta_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ta_ecommerce/common/widgets/loaders/vertical_product_shimmer.dart';
import 'package:ta_ecommerce/common/widgets/products/sortable_products.dart';
import 'package:ta_ecommerce/controller/merchant_controller/merchant_controller.dart';
import 'package:ta_ecommerce/model/merchant_model.dart';
import 'package:ta_ecommerce/utils/constans/sizes.dart';
import 'package:ta_ecommerce/utils/helper/cloud_helper_functions.dart';

import '../../../common/widgets/merchant/merchant_card.dart';

class MerchantProducts extends StatelessWidget {
  const MerchantProducts({Key? key, required this.merchant}) : super(key: key);

  final MerchantModel merchant;
  @override
  Widget build(BuildContext context) {
    final controller = MerchantController.instance;
    return Scaffold(
      appBar: TAppBar(title: Text(merchant.name), showBackArrow: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            /// Merchant detail
            TMerchantCard(showBorder: true, merchant: merchant),
            const SizedBox(height: TSizes.spaceBtwItem),
            FutureBuilder(
                future: controller.getMerchantProducts(merchant.id),
                builder: (context, snapshot) {
                  // handle loader, no record, or error message
                  const loader = TVerticalProductShimmer();
                  final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                  if (widget != null) return widget;

                  // record found
                  final merchantProducts = snapshot.data!;
                  return TSortableProducts(products: merchantProducts);
                }),
          ],
        ),
      ),
    );
  }
}
