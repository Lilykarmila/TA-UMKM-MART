import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_ecommerce/controller/chat_controller/chat_controller.dart';
import 'package:ta_ecommerce/utils/constans/colors.dart';
import 'package:ta_ecommerce/utils/constans/image_strings.dart';
import 'package:ta_ecommerce/view/chat/widget/chat_bubble_widget.dart';
import 'package:ta_ecommerce/view/chat/widget/chat_input.dart';
import 'header_detail_chat.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatRoomPage extends StatelessWidget {
  const ChatRoomPage({
    Key? key,
    required this.merchantName,
    required this.merchantId,
    required this.merchantImage,
    required this.merchantType,
  }) : super(key: key);

  final String merchantName;
  final String merchantId;
  final String merchantImage;
  final String merchantType;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChatController());

    final url = 'https://fe5f-125-167-118-241.ngrok-free.app/api/decrypt';

    final loginId = controller.getLoginId();
    var key = "";
    // print("Merchant Type:" + merchantType?);
    if (merchantType == "user") {
      key = merchantId.substring(0, 8) + loginId.substring(0, 8);
    } else {
      key = loginId.substring(0, 8) + merchantId.substring(0, 8);
    }

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
                  return FutureBuilder(
                    future: Future.wait(docs.map((doc) async {
                      final data = doc.data() as Map<String, dynamic>;

                      Map<String, dynamic> requestBody = {
                        'ciphertext': data["message"],
                        'key': key,
                      };

                      final response = await http.post(Uri.parse(url), body: requestBody);

                      if (response.statusCode == 200) {
                        final jsonResponse = json.decode(response.body);
                        data["message"] = jsonResponse["output"];
                      } else {
                        throw Exception('Failed to fetch data');
                      }

                      return data;
                    })),
                    builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final data = snapshot.data![index];
                            return TChatBubble(
                              isSender: data["senderId"] == loginId,
                              text: data["message"],
                            );
                          },
                        );
                      }
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
