import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ta_ecommerce/model/merchant_model.dart';
import 'package:ta_ecommerce/utils/constans/colors.dart';
import 'package:ta_ecommerce/utils/helper/helper_functions.dart';

import '../../../utils/constans/enums.dart';
import '../../../utils/constans/image_strings.dart';
import '../../../utils/constans/sizes.dart';
import '../../common/widgets/images/t_circular_image.dart';
import '../../common/widgets/products/rounded_container.dart';
import '../../common/widgets/text/t_category_title_text_with_icon.dart';

class AdminMerchantCard extends StatelessWidget {
  const AdminMerchantCard({
    super.key,
    required this.showBorder,
    this.onTap,
    required this.merchant,
  });

  final MerchantModel merchant;
  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: TRoundedContainer(
        borderColor: TColors.primaryColor,
        padding: EdgeInsets.all(TSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// icon
            Container(
              // color: Colors.orange,
              child: TCircularImage(
                isNetworkImage: true,
                image: merchant.image,
                backgroundColor: Colors.transparent,
                // overlayColor: isDark ? Colors.white : TColors.black,
              ),
            ),
            SizedBox(width: TSizes.spaceBtwItem / 2),

            /// text
            Expanded(
              child: TMerchantWithIcon(title: merchant.name, brandTextSize: TextSizes.medium),
            ),
            Icon(Iconsax.arrow_right_34, size: 18),
          ],
        ),
      ),
    );
  }
}
