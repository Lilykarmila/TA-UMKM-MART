import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ta_ecommerce/utils/constans/colors.dart';
import 'package:ta_ecommerce/utils/constans/image_strings.dart';
import 'package:ta_ecommerce/utils/constans/sizes.dart';

import '../../../controller/chat_controller/chat_controller.dart';

class TChatInput extends StatelessWidget {
  const TChatInput({Key? key, required this.merchantId, required this.merchantImage, required this.merchantName})
      : super(key: key);
  final String merchantId;
  final String merchantName;
  final String merchantImage;
  @override
  Widget build(BuildContext context) {
    final TextEditingController _textController = TextEditingController();
    final controller = Get.put(ChatController());
    return Container(
      margin: EdgeInsets.all(5),
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: TextFormField(
                  // style: Theme.of(context).textTheme.labelMedium,
                  decoration: InputDecoration(
                    hintText: 'Ketik pesan...',
                    hintStyle: TextStyle(color: TColors.darkerGrey),
                  ),
                  controller: _textController,
                ),
              ),
            ),
          ),
          SizedBox(width: 5),
          GestureDetector(
            onTap: () {
              controller.sendMessages(merchantId, merchantName, "", merchantImage, _textController.text);
              _textController.clear();
            },
            child: Image.asset(
              TImages.sendChat,
              width: TSizes.icosLg,
            ),
          ),
        ],
      ),
    );
  }
}
