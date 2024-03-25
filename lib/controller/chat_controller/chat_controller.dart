import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:ta_ecommerce/data/repositories/chat_repository.dart';
import 'package:ta_ecommerce/data/repositories/user_repository.dart';
import 'package:ta_ecommerce/model/merchant_model.dart';

import '../../model/chat_model.dart';
import '../../model/user_model.dart';

class ChatController extends GetxController {
  static ChatController get instance => Get.find();

  final repository = Get.put(ChatRepository());
  final uRepo = Get.put(UserRepository());
  final firebase = FirebaseAuth.instance;

  void sendMessages(String receiverId, String receiverName, String receiverEmail, String receiverImage, String message) async{
    try {
      UserModel user = await uRepo.fetchUserDetails();
      print(user.uid);
      repository.sendMessages(user, receiverId, receiverName, receiverEmail, receiverImage, message);
    }
    catch(e){
      throw e.toString();
    }
  }
  Stream<QuerySnapshot>? getMessages(String userId, String otherUserId) {
    try{
      if (userId == "" || otherUserId == "") return null;
      final messages = repository.getMessages(userId, otherUserId);
      print(userId+otherUserId);
      return messages;
    }catch(e){
      return null;
    }
  }

  String getLoginId(){
    return firebase.currentUser!=null ? firebase.currentUser!.uid : "";
  }

  Stream<List<UserModel>> getListChatFromUserLogin(String userId)  {
    try{
      print(userId+" lala");
      final list = repository.getListChatFromUserLogin(userId);
      return list;
    }catch(e){
      rethrow;
    }
  }
}
