import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ta_ecommerce/utils/constans/sizes.dart';

class TProfileMenu extends StatelessWidget {
  const TProfileMenu({
    super.key,
    this.icon,
    this.onPressed,
    required this.title,
    required this.value,
  });

  final IconData? icon;
  final VoidCallback? onPressed;
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: TSizes.spaceBtwItem / 1.5),
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Text(title, style: Theme.of(context).textTheme.bodySmall, overflow: TextOverflow.ellipsis)),
            Expanded(
                flex: 5,
                child: Text(value, style: Theme.of(context).textTheme.bodySmall, overflow: TextOverflow.ellipsis)),
            Expanded(child: Icon(icon, size: 18)),
          ],
        ),
      ),
    );
  }
}
