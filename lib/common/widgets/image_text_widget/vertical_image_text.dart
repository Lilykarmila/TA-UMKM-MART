import 'package:flutter/material.dart';
import 'package:ta_ecommerce/common/widgets/images/t_circular_image.dart';
import 'package:ta_ecommerce/utils/helper/helper_functions.dart';

import '../../../utils/constans/colors.dart';
import '../../../utils/constans/sizes.dart';

class TVerticaImageText extends StatelessWidget {
  const TVerticaImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = TColors.white,
    this.backgroundColor = TColors.white,
    this.onTap,
    this.isNetworkImage = true,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItem),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TCircularImage(
              image: image,
              // fit: BoxFit.cover,
              padding: TSizes.sm * 1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              // overlayColor: THelperFunctions.isDarkMode(context) ? TColors.light : TColors.dark,
            ),
            const SizedBox(height: TSizes.spaceBtwItem / 4),
            Text(
              title,
              style: Theme.of(context).textTheme.labelMedium!.apply(color: textColor),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
