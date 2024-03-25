import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_ecommerce/controller/chat_controller/chat_controller.dart';
import 'package:ta_ecommerce/utils/constans/colors.dart';
import 'package:ta_ecommerce/utils/constans/image_strings.dart';
import 'package:ta_ecommerce/view/chat/widget/chat_bubble_widget.dart';
import 'package:ta_ecommerce/view/chat/widget/chat_input.dart';
import 'header_detail_chat.dart';

class ChatRoomPage extends StatelessWidget {
  const ChatRoomPage({
    Key? key,
    required this.merchantName,
    required this.merchantId,
    required this.merchantImage,
  }) : super(key: key);

  final String merchantName;
  final String merchantId;
  final String merchantImage;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChatController());

    return Scaffold(
      appBar: THeaderChat(
        showBackArrow: true,
        merchantName: merchantName,
        merchantImage: merchantImage,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(TImages.bgChatRoom2),
                  fit: BoxFit.cover,
                ),
              ),
              width: Get.width,
              child: StreamBuilder(
                stream: controller.getMessages(merchantId, controller.getLoginId()),
                builder: (context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  final List<DocumentSnapshot> docs = snapshot.data.docs;
                  return ListView.builder(
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      final data = docs[index].data() as Map<String, dynamic>;
                      return TChatBubble(
                        isSender: data["senderId"] == controller.getLoginId(),
                        text: data["message"],
                      );
                    },
                  );
                },
              ),
            ),
          ),
          TChatInput(
            merchantImage: merchantImage,
            merchantName: merchantName,
            merchantId: merchantId,
          ),
        ],
      ),
    );
  }
}
