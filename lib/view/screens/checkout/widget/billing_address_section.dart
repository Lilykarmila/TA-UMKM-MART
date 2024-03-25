import 'package:flutter/material.dart';
import 'package:ta_ecommerce/common/widgets/text/section_heading.dart';
import 'package:ta_ecommerce/utils/constans/colors.dart';

import '../../../../utils/constans/sizes.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(title: 'Alamat pengiriman', buttonTitle: 'Ubah', onPressed: () {}),
        Text('Lily karmila', style: Theme.of(context).textTheme.bodyLarge),
        SizedBox(height: TSizes.spaceBtwItem / 2),
        Row(
          children: [
            Icon(Icons.phone, color: TColors.grey, size: 16),
            SizedBox(width: TSizes.spaceBtwItem),
            Text('08877887878', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItem / 2),
        Row(
          children: [
            Icon(Icons.location_history, color: TColors.grey, size: 16),
            SizedBox(width: TSizes.spaceBtwItem),
            Text('depan kampus uho', style: Theme.of(context).textTheme.bodyMedium, softWrap: true),
          ],
        ),
      ],
    );
  }
}
