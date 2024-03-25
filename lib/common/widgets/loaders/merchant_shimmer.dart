import 'package:flutter/material.dart';
import 'package:ta_ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:ta_ecommerce/common/widgets/loaders/shimmer_loader.dart';

class TMerchantShimmer extends StatelessWidget {
  const TMerchantShimmer({Key? key, this.itemCount = 4}) : super(key: key);

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return TGridLayout(
      mainAxisExtend: 80,
      itemCount: itemCount,
      itemBuilder: (_, __) => TShimmerEffect(width: 300, height: 80),
    );
  }
}
