import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_ecommerce/common/widgets/images/t_circular_image.dart';
import 'package:ta_ecommerce/model/chat_model.dart';
import 'package:ta_ecommerce/model/merchant_model.dart';
import 'package:ta_ecommerce/model/user_model.dart';
import 'package:ta_ecommerce/utils/constans/colors.dart';
import 'package:ta_ecommerce/utils/constans/sizes.dart';
import 'package:ta_ecommerce/view/chat/widget/chat_room.dart';

class ChatList extends StatefulWidget {
  const ChatList({Key? key, this.merchant, this.chatModel, required this.userModel}) : super(key: key);
  final MerchantModel? merchant;
  final ChatModel? chatModel;
  final UserModel userModel;

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    final chatModel = ChatModel();
    return GestureDetector(
      onTap: () => Get.to(ChatRoomPage(
        merchantImage: widget.userModel.profilePicture,
        merchantName: widget.userModel.username,
        merchantId: widget.userModel.uid,
        merchantType: widget.userModel.type.toString(),
        // merchantType: widget.merchant.type.toString(),
      )),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                // TCircleAvatarImage(backgroundImage: merchant.image, isNetworkImage: true),
                TCircularImage(image: widget.userModel.profilePicture, isNetworkImage: true),
                // Image.asset(TImages.categoryFashion, width: TSizes.icosLg),
                const SizedBox(width: TSizes.spaceBtwItem),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.userModel.username, style: Theme.of(context).textTheme.titleSmall),
                      // Text('JL. HEA Mokodompit Lr. Mata Air 2',
                      //     style: Theme.of(context).textTheme.labelMedium, overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),

                if (chatModel.timestamp != null)
                  Text(chatModel.timestamp.toString(), style: Theme.of(context).textTheme.labelSmall),

                // Text(chatModel.timestamp.toString(), style: Theme.of(context).textTheme.labelSmall),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItem),
            const Divider(thickness: 1, color: TColors.grey)
          ],
        ),
      ),
    );
  }
}
