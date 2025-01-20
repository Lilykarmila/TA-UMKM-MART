import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ta_ecommerce/common/widgets/loaders/shimmer_loader.dart';

import '../../../utils/constans/colors.dart';
import '../../../utils/constans/sizes.dart';
import '../../../utils/helper/helper_functions.dart';

class TCircleAvatarImage extends StatelessWidget {
  const TCircleAvatarImage({
    Key? key,
    this.fit = BoxFit.cover,
    required this.backgroundImage,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.maxRadius = 30,
    this.padding = TSizes.sm,
  }) : super(key: key);

  final BoxFit? fit;
  final String backgroundImage;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double maxRadius, padding;

  @override
  Widget build(BuildContext context) {
    return isNetworkImage
        ? CachedNetworkImage(
            fit: fit,
            color: overlayColor,
            imageUrl: backgroundImage,
            progressIndicatorBuilder: (context, url, downloadProgress) => const TShimmerEffect(width: 55, height: 55),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          )
        : SizedBox(
            width: 40,
            height: 40,
            child: CircleAvatar(
              maxRadius: maxRadius,
              backgroundImage: AssetImage(backgroundImage),
              backgroundColor:
                  backgroundColor ?? (THelperFunctions.isDarkMode(context) ? TColors.lightGrey : TColors.grey),

              // child: Container(
              //   // width: width,
              //   // height: height,
              //   padding: EdgeInsets.all(padding),
              //   // decoration: BoxDecoration(
              //   //   color: backgroundColor ?? (THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white),
              //   // ),
              // ),
            ),
          );
  }
}
