import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_ecommerce/common/widgets/products/rounded_container.dart';
import 'package:ta_ecommerce/common/widgets/succes_screen/succes_screen.dart';
import 'package:ta_ecommerce/navigation_menu.dart';
import 'package:ta_ecommerce/utils/constans/colors.dart';
import 'package:ta_ecommerce/utils/constans/image_strings.dart';
import 'package:ta_ecommerce/utils/constans/sizes.dart';
import 'package:ta_ecommerce/utils/helper/helper_functions.dart';
import 'package:ta_ecommerce/view/screens/cart/widget/cart_items.dart';
import 'package:ta_ecommerce/view/screens/checkout/widget/billing_address_section.dart';
import 'package:ta_ecommerce/view/screens/checkout/widget/billing_amount_section.dart';
import 'package:ta_ecommerce/view/screens/checkout/widget/billing_payment_section.dart';

import '../../../common/widgets/appbar/appbar.dart';
import '../../../common/widgets/products/cart/coupon_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
          showBackArrow: true, title: Text('Detail Pesanan ', style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// items in cart
              const TCartItems(showAddRemoveButton: false),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// coupon textfield
              const TCouponCode(),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// billing section
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: const Column(
                  children: [
                    /// pricing
                    TBillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwItem),

                    /// divider
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItem),

                    /// payment methods
                    TBillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItem),

                    /// address
                    TBillingAddressSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      /// checkout button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => SuccessScreen(
                image: TImages.deliveredEmailIllustrations,
                title: 'Payment Succes',
                subTitle: 'nakjhkhsadbksha',
                onPressed: () => Get.offAll(() => const NavigationMenu()),
              )),
          child: const Text('Checkout IDR 240'),
        ),
      ),
    );
  }
}
