import 'package:flutter/material.dart';
import 'package:ta_ecommerce/common/widgets/loaders/shimmer_loader.dart';
import 'package:ta_ecommerce/utils/constans/sizes.dart';

class TCategoryShimmer extends StatelessWidget {
  const TCategoryShimmer({
    Key? key,
    this.itemCount = 6,
  }) : super(key: key);

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(width: TSizes.spaceBtwItem),
        itemCount: itemCount,
        itemBuilder: (_, __) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // image
              TShimmerEffect(width: 55, height: 55, radius: 55),
              SizedBox(height: TSizes.spaceBtwItem / 2),

              // text
              TShimmerEffect(width: 55, height: 8),
            ],
          );
        },
      ),
    );
  }
}
