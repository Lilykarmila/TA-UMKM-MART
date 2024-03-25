import 'package:flutter/material.dart';
import 'package:ta_ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:ta_ecommerce/common/widgets/loaders/shimmer_loader.dart';
import 'package:ta_ecommerce/utils/constans/sizes.dart';

class TVerticalProductShimmer extends StatelessWidget {
  const TVerticalProductShimmer({Key? key, this.itemCount = 4}) : super(key: key);

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return TGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// image
            TShimmerEffect(width: 180, height: 180),
            SizedBox(height: TSizes.spaceBtwItem),

            /// text
            TShimmerEffect(width: 160, height: 15),
            SizedBox(height: TSizes.spaceBtwItem / 2),
            TShimmerEffect(width: 110, height: 15),
          ],
        ),
      ),
    );
  }
}
