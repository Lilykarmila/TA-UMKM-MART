import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_ecommerce/common/widgets/images/t_circle_avatar_images.dart';
import 'package:ta_ecommerce/common/widgets/images/t_circular_image.dart';
import 'package:ta_ecommerce/common/widgets/images/t_rounded_image.dart';
import 'package:ta_ecommerce/model/chat_model.dart';
import 'package:ta_ecommerce/model/merchant_model.dart';
import 'package:ta_ecommerce/utils/constans/colors.dart';
import 'package:ta_ecommerce/utils/constans/image_strings.dart';
import 'package:ta_ecommerce/utils/constans/sizes.dart';
import 'package:ta_ecommerce/view/chat/widget/chat_room.dart';

class ChatList extends StatefulWidget {
  const ChatList({Key? key, required this.merchantModel, this.chatModel}) : super(key: key);
  final MerchantModel merchantModel;
  final ChatModel? chatModel;

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    final chatModel = ChatModel();
    return GestureDetector(
      onTap: () => Get.to(ChatRoomPage(
        merchantImage: widget.merchantModel.image,
        merchantName: widget.merchantModel.name,
        merchantId: widget.merchantModel.id,
      )),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                // TCircleAvatarImage(backgroundImage: merchantModel.image, isNetworkImage: true),
                TCircularImage(image: widget.merchantModel.image, isNetworkImage: true),
                // Image.asset(TImages.categoryFashion, width: TSizes.icosLg),
                SizedBox(width: TSizes.spaceBtwItem),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.merchantModel.name, style: Theme.of(context).textTheme.titleSmall),
                      // Text('JL. HEA Mokodompit Lr. Mata Air 2',
                      //     style: Theme.of(context).textTheme.labelMedium, overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),

                if (chatModel != null && chatModel!.timestamp != null)
                  Text(chatModel!.timestamp.toString(), style: Theme.of(context).textTheme.labelSmall),

                // Text(chatModel.timestamp.toString(), style: Theme.of(context).textTheme.labelSmall),
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
