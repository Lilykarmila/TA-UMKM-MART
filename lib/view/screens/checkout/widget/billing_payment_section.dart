import 'package:flutter/material.dart';
import 'package:ta_ecommerce/common/widgets/products/rounded_container.dart';
import 'package:ta_ecommerce/common/widgets/text/section_heading.dart';
import 'package:ta_ecommerce/utils/constans/colors.dart';
import 'package:ta_ecommerce/utils/constans/image_strings.dart';
import 'package:ta_ecommerce/utils/helper/helper_functions.dart';

import '../../../../utils/constans/sizes.dart';

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TSectionHeading(title: 'Metode pembayaran', buttonTitle: 'Pilih', onPressed: () {}),
        const SizedBox(height: TSizes.spaceBtwItem / 2),
        Row(
          children: [
            TRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? TColors.light : TColors.white,
              padding: const EdgeInsets.all(TSizes.sm),
              child: const Image(image: AssetImage(TImages.paymentBni), fit: BoxFit.contain),
            ),
            const SizedBox(width: TSizes.spaceBtwItem / 2),
            Text('Bank BNI', style: Theme.of(context).textTheme.bodyLarge),
          ],
        )
      ],
    );
  }
}
