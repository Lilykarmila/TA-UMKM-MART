import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ta_ecommerce/utils/constans/colors.dart';
import 'package:ta_ecommerce/utils/constans/sizes.dart';
import 'package:ta_ecommerce/utils/helper/helper_functions.dart';

import '../../../../common/widgets/products/rounded_container.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({Key? key, required this.selectedAddress}) : super(key: key);

  final bool selectedAddress;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      padding: EdgeInsets.all(TSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress ? TColors.primaryColor.withOpacity(0.5) : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
              ? TColors.darkerGrey
              : TColors.grey,
      margin: EdgeInsets.only(bottom: TSizes.spaceBtwItem),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress
                  ? dark
                      ? TColors.light
                      : TColors.dark.withOpacity(0.6)
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'John Doe',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: TSizes.sm / 2),
              Text('0887 7887 8787', maxLines: 1, overflow: TextOverflow.ellipsis),
              SizedBox(height: TSizes.sm / 2),
              Text('Jl. HEA Mokodompit, Lr Mata air 2, samping Maharani mart', softWrap: true),
            ],
          )
        ],
      ),
    );
  }
}
