import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ta_ecommerce/common/widgets/products/rounded_container.dart';
import 'package:ta_ecommerce/utils/constans/colors.dart';
import 'package:ta_ecommerce/utils/constans/sizes.dart';
import 'package:ta_ecommerce/utils/helper/helper_functions.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 3,
      separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwItem),
      itemBuilder: (_, index) => TRoundedContainer(
        padding: const EdgeInsets.all(TSizes.md),
        showBorder: true,
        backgroundColor: dark ? TColors.dark : TColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                /// 1 - icon
                const Icon(Iconsax.ship),
                const SizedBox(width: TSizes.spaceBtwItem / 2),

                /// 2 - status & date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Dalam proses',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .apply(color: TColors.primaryColor, fontWeightDelta: 1)),
                      Text('21 Nov 2023', style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),

                /// 3 - icon
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Iconsax.arrow_right_34, size: TSizes.icosSm),
                )
              ],
            ),

            const SizedBox(height: TSizes.spaceBtwItem),

            /// row 2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      /// 1 - icon
                      const Icon(Iconsax.tag),
                      const SizedBox(width: TSizes.spaceBtwItem / 2),

                      /// 2 - status & date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Pesanan', style: Theme.of(context).textTheme.labelMedium),
                            Text('#3272367', style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      /// 1 - icon
                      const Icon(Iconsax.calendar),
                      const SizedBox(width: TSizes.spaceBtwItem / 2),

                      /// 2 - status & date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Tanggal pengiriman', style: Theme.of(context).textTheme.labelMedium),
                            Text('21 sept 2023', style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
