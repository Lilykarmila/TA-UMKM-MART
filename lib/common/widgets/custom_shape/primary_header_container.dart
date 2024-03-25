import 'package:flutter/material.dart';

import '../../../utils/constans/colors.dart';
import 'curved_edges_widget.dart';
import 'circular_containers.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
        color: TColors.primaryColor,
        child: Stack(
          children: [
            /// -- background custom shape
            Positioned(
                top: -150, right: -250, child: TCircularContainer(backgroundColor: TColors.textWhite.withOpacity(0.1))),
            Positioned(
                top: 100, right: -300, child: TCircularContainer(backgroundColor: TColors.textWhite.withOpacity(0.1))),
            child,
          ],
        ),
      ),
    );
  }
}
