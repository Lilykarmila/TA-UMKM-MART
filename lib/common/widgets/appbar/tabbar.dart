import 'package:flutter/material.dart';
import 'package:ta_ecommerce/utils/constans/colors.dart';
import 'package:ta_ecommerce/utils/helper/helper_functions.dart';

import '../../../utils/devices/devices_utility.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  const TTabBar({Key? key, required this.tabs}) : super(key: key);

  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? TColors.black : TColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: TColors.primaryColor,
        labelColor: dark ? TColors.white : TColors.primaryColor,
        unselectedLabelColor: TColors.darkGrey,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppbarHeight());
}
