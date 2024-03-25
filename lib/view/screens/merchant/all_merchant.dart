import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ta_ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:ta_ecommerce/common/widgets/text/section_heading.dart';
import 'package:ta_ecommerce/controller/merchant_controller/merchant_controller.dart';
import 'package:ta_ecommerce/utils/constans/sizes.dart';

import '../../../common/widgets/loaders/merchant_shimmer.dart';
import '../../../common/widgets/merchant/merchant_card.dart';
import '../../../model/merchant_model.dart';
import 'merchant_products.dart';

class AllMerchantScreen extends StatelessWidget {
  const AllMerchantScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final merchantController = MerchantController.instance;

    return Scaffold(
      appBar: TAppBar(title: Text('Toko'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// heading
              TSectionHeading(title: 'Semua Toko', showActionButton: false),
              SizedBox(height: TSizes.spaceBtwSections),

              /// brand

              Obx(
                () {
                  if (merchantController.isLoading.value) return const TMerchantShimmer();
                  if (merchantController.allMerchants.isEmpty) {
                    return Center(
                        child: Text('Data Tidak Ditemukan!',
                            style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
                  }

                  return TGridLayout(
                      itemCount: merchantController.allMerchants.length,
                      mainAxisExtend: 80,
                      itemBuilder: (_, index) {
                        final merchant = merchantController.allMerchants[index];
                        return TMerchantCard(
                          merchant: merchant,
                          showBorder: true,
                          onTap: () => Get.to(() => MerchantProducts(merchant: merchant)),
                        );
                      });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
