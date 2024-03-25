import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:ta_ecommerce/common/widgets/products/rating_indicator.dart';
import 'package:ta_ecommerce/common/widgets/products/rounded_container.dart';
import 'package:ta_ecommerce/utils/constans/colors.dart';
import 'package:ta_ecommerce/utils/constans/image_strings.dart';
import 'package:ta_ecommerce/utils/constans/sizes.dart';
import 'package:ta_ecommerce/utils/helper/helper_functions.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(backgroundImage: AssetImage(TImages.user)),
                SizedBox(width: TSizes.spaceBtwItem),
                Text('John Doe', style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ],
        ),

        SizedBox(height: TSizes.spaceBtwItem),

        /// review
        Row(
          children: [
            TRatingBarIndicator(rating: 4),
            SizedBox(width: TSizes.spaceBtwItem),
            Text('10 oct, 2023', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItem),
        ReadMoreText(
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: '  lebih sedikit',
          trimCollapsedText: '   lainnya',
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primaryColor),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primaryColor),
        ),

        SizedBox(height: TSizes.spaceBtwItem),

        /// company review
        TRoundedContainer(
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Padding(
            padding: EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Sweet Store', style: Theme.of(context).textTheme.titleMedium),
                    Text('10 Oct, 2023', style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                SizedBox(height: TSizes.spaceBtwItem),
                ReadMoreText(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: '  lebih sedikit',
                  trimCollapsedText: '   lainnya',
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primaryColor),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primaryColor),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: TSizes.spaceBtwItem),
      ],
    );
  }
}
