import 'package:flutter/cupertino.dart';
import 'package:ta_ecommerce/common/widgets/text/t_category_title_text.dart';
import 'package:ta_ecommerce/utils/constans/colors.dart';
import 'package:ta_ecommerce/utils/constans/enums.dart';
import 'package:ta_ecommerce/utils/constans/sizes.dart';

class TMerchantWithIcon extends StatelessWidget {
  const TMerchantWithIcon({
    Key? key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = TColors.primaryColor,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  }) : super(key: key);

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: TCategoryTitleText(
            title: title,
            color: textColor,
            maxLines: maxLines,
            categoryTextSize: brandTextSize,
          ),
        ),
        const SizedBox(width: TSizes.xs),
        // Icon(Iconsax.verify5, color: iconColor, size: TSizes.xs),
      ],
    );
  }
}
