import 'package:flutter/material.dart';
import 'package:ta_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ta_ecommerce/utils/constans/sizes.dart';
import 'package:ta_ecommerce/view/screens/orders/widgets/orders_list.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// appbar
      appBar:
          TAppBar(title: Text('Pesanan Saya', style: Theme.of(context).textTheme.headlineSmall), showBackArrow: true),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),

        /// orders
        child: TOrderListItems(),
      ),
    );
  }
}
