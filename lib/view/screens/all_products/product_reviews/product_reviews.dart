import 'package:flutter/material.dart';
import 'package:ta_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ta_ecommerce/utils/constans/sizes.dart';

import '../../../../common/widgets/products/rating_indicator.dart';
import 'widgets/rating_progress_indicator.dart';
import 'widgets/user_review_card.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// appbar
      ///
      appBar: TAppBar(title: Text('Reviews & Ratings'), showBackArrow: true),

      /// body
      ///
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been'),
              SizedBox(height: TSizes.spaceBtwItem),

              /// overall product ratings
              TOverallProductRating(),
              TRatingBarIndicator(rating: 2.7),
              Text('12,611', style: Theme.of(context).textTheme.bodySmall),

              /// user review list
              UserReviewCard(),
              UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
