import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_ecommerce/utils/constans/colors.dart';
import 'package:ta_ecommerce/utils/constans/image_strings.dart';
import 'package:ta_ecommerce/utils/constans/sizes.dart';

import '../../../controller/chat_controller/chat_controller.dart';

class TChatInput extends StatelessWidget {
  const TChatInput({Key? key, required this.merchantId, required this.merchantImage, required this.merchantName}) : super(key: key);
  final String merchantId;
  final String merchantName;
  final String merchantImage;
  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();
    final controller = Get.put(ChatController());
    return Container(
      margin: const EdgeInsets.all(5),
      child: Row(
        children: [
          Expanded(
            child: Container(
              // decoration: BoxDecoration(color: TColors.grey, borderRadius: BorderRadius.circular(12)),
              // height: 80,
              // padding: EdgeInsets.symmetric(vertical: 5),

              child: Center(
                child: TextFormField(
                  // style: Theme.of(context).textTheme.labelMedium,
                  decoration: const InputDecoration(
                    hintText: 'Ketik pesan...',
                    hintStyle: TextStyle(color: TColors.darkerGrey),
                  ),
                  controller: textController,
                ),
              ),
            ),
          ),
          const SizedBox(width: 5),
          GestureDetector(
            onTap: () {
              controller.sendMessages(merchantId, merchantName, "", merchantImage, textController.text );
              textController.clear();
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
