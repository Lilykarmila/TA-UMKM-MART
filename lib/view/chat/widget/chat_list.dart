import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_ecommerce/model/merchant_model.dart';
import 'package:ta_ecommerce/utils/constans/colors.dart';
import 'package:ta_ecommerce/utils/constans/image_strings.dart';
import 'package:ta_ecommerce/utils/constans/sizes.dart';
import 'package:ta_ecommerce/view/chat/widget/chat_room.dart';

class ChatList extends StatelessWidget {
  const ChatList({Key? key, required this.merchantModel}) : super(key: key);
  final MerchantModel merchantModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(ChatRoomPage(
        merchantImage: merchantModel.image,
        merchantName: merchantModel.name,
        merchantId: merchantModel.id,
      )),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(TImages.categoryFashion, width: TSizes.icosLg),
                SizedBox(width: TSizes.spaceBtwItem),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(merchantModel.name, style: Theme.of(context).textTheme.titleSmall),
                      // Text('JL. HEA Mokodompit Lr. Mata Air 2',
                      //     style: Theme.of(context).textTheme.labelMedium, overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
                Text('Sekarang', style: Theme.of(context).textTheme.labelSmall),
              ],
            ),
            SizedBox(height: TSizes.spaceBtwItem),
            Divider(thickness: 1, color: TColors.grey)
          ],
        ),
      ),
    );
  }
}
