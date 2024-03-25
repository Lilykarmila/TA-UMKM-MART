import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ta_ecommerce/utils/constans/colors.dart';
import 'package:ta_ecommerce/utils/constans/sizes.dart';

/// a widget for displaying an animate loading indicator with optional text and action button.
class TAnimationLoaderWidget extends StatelessWidget {
  ///  default constructor for the TAnimationLoaderWidget
  ///
  /// parameters :
  ///  - text: the text tp be displayed below the animation.
  ///  - animation: the path to the lottie animation file.
  ///  - showAction: whether to show an action button below the text
  ///  - actionText: the text to be displayed on the action button.
  ///  - onActionPressed: callback function to be execute when action button is pressed

  const TAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation, width: MediaQuery.of(context).size.width * 0.7),
          Text(text, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
          const SizedBox(height: TSizes.defaultSpace),
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                    onPressed: onActionPressed,
                    style: OutlinedButton.styleFrom(backgroundColor: TColors.dark),
                    child: Text(
                      actionText!,
                      style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.light),
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
