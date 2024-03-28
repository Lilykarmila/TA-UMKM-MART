import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ta_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ta_ecommerce/model/merchant_model.dart';
import 'package:ta_ecommerce/view/chat/widget/chat_list.dart';
import '../../controller/chat_controller/chat_controller.dart';
import '../../model/user_model.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChatController());
    return Scaffold(
      appBar: TAppBar(
          title: Text(
            'Chat',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          showBackArrow: false),
      body: StreamBuilder<List<UserModel>>(
          stream: controller.getListChatFromUserLogin(controller.getLoginId()),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator()); // Display a loading indicator
            } else if (snapshot.hasError) {
              return Text(
                'Error: ${snapshot.error}',
                style: TextStyle(color: Colors.black),
              );
            } else {
              // Data has been successfully retrieved
              List<UserModel> merchantList = snapshot.data!;
              if (merchantList.isEmpty) {
                return Center(
                    child: Text(
                  'No Chat Available',
                  style: TextStyle(color: Colors.black),
                ));
              }
              // Use the merchantList to build your UI, for example:
              return ListView.builder(
                itemCount: merchantList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: ChatList(
                    merchantModel: MerchantModel(
                        id: merchantList[index].uid,
                        image: merchantList[index].profilePicture,
                        name: merchantList[index].fullName,
                        isFeatured: true,
                        description: merchantList[index].updateTime),
                  )
                      // Add more widget for displaying merchant details as needed
                      );
                },
              );
            }
          }),
    );
  }
}
