import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ta_ecommerce/data/repositories/merchant_repository.dart';
import 'package:ta_ecommerce/data/services/chat_services.dart';
import 'package:ta_ecommerce/model/chat_model.dart';
import 'package:ta_ecommerce/model/merchant_model.dart';
import 'package:ta_ecommerce/model/user_model.dart';
import 'package:ta_ecommerce/utils/exceptions/firebase_exceptions.dart';

import '../../model/product_model.dart';
import '../../utils/exceptions/platform_exceptions.dart';
import '../services/firebase_storage_service.dart';
class ChatRepository extends GetxController {
  static ChatRepository get instance => Get.find();
  final repository = Get.put(MerchantRepository());
  final _db = FirebaseFirestore.instance;

  // Future<List<List<ChatModel>>> getListChatFromUserLogin(String userId) async {
  //   try {
  //     List<List<ChatModel>> allChats = [];
  //     final snapshot = await _db.collection('chat_room').get();
  //     for(var doc in snapshot.docs) {
  //       if (doc.id.split("_").contains(userId)){
  //         final feed = await FirebaseFirestore.instance.collection("chat_room")
  //             .doc(doc.id).collection("messages").get();
  //         allChats.add(feed.docs.map((e) => ChatModel.fromSnapshot(e)).toList());
  //       }
  //     }
  //     return allChats;
  //   } on FirebaseException catch (e) {
  //     throw TFirebaseException(e.code).message;
  //   } on PlatformException catch (e) {
  //     throw TPlatformException(e.code).message;
  //   } catch (e) {
  //     throw 'Something went wrong, Please try again';
  //   }
  // }
  Stream<List<UserModel>> getListChatFromUserLogin(String userId)  {
    try {
      final service = Get.put(ChatServices());
      return service.getListChatFromUserLogin(userId);
    }
    catch(e){
      throw e.toString();
    }
  }
  void sendMessages(UserModel user, String receiverId, String receiverName, String receiverEmail, String receiverImage, String message){
    try {
      final service = Get.put(ChatServices());
      service.sendMessage(user, receiverId, receiverName, receiverEmail, receiverImage, message);
    }
    catch(e){
      throw e.toString();
    }
  }

  Stream<QuerySnapshot> getMessages(String userId, String otherUserId){
    try {
      final service = Get.put(ChatServices());
      return service.getMessages(userId, otherUserId);
    }
    catch(e){
      throw e.toString();
    }
  }
}