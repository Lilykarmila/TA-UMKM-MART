import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_ecommerce/model/chat_model.dart';
import 'package:ta_ecommerce/model/user_model.dart';

import '../../model/merchant_model.dart';
import '../../utils/exceptions/firebase_exceptions.dart';
import '../repositories/merchant_repository.dart';

class ChatServices extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final repository = Get.put(MerchantRepository());
  // Future<void> addChat({UserModel? user, bool? isFromUser, String? chat}) async {
  //   try {
  //     await firestore.collection('Chat').add({
  //       'userId': user!.uid,
  //       'userName': user.fullName,
  //       'userImage': user.profilePicture,
  //       'isFromUser': true,
  //       'createdAt': DateTime.now().toIso8601String(),
  //       'updatedAt': DateTime.now().toIso8601String(),
  //     });
  //     print('Pesan berhasil dikirim!');
  //   } catch (e) {
  //     throw Exception('Pesan gagal dikirim');
  //   }
  // }

  Stream<List<UserModel>> getListChatFromUserLogin(String userId) {
    try {
      return FirebaseFirestore.instance
          .collection("Chat")
          .snapshots()
          .asyncMap((snapshot) => _processSnapshot(snapshot, userId));
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    }
  }

  Future<List<UserModel>> _processSnapshot(
      QuerySnapshot<Map<String, dynamic>> snapshot, String userId) async {
    List<UserModel> allChats = [];
    print("jennoi ${snapshot.docs.length}");
    for (var doc in snapshot.docs) {
      // Assuming your document structure is as expected
      print("jennoi doc : ${doc.id} userId: ${userId}");

      if (doc.id.contains(userId)) {
        // print("jennoi con ${doc.id.contains(userId)}");
        final roomId = doc.id.split("_");
        print("jennoi con ${roomId}");
        for (int i = 0; i < roomId.length; i++) {
          if (roomId[i] != userId) {
            print("jennoi id ${roomId[i]}");
            final m = await repository.getFilteredMerchants(roomId[i]);
            print("jennoi m ${m}");
            if (m != null) {
              allChats.add(m);
            }
          }
        }
      }
    }

    return allChats;
  }

  Future<void> sendMessage(UserModel user, String receiverId, String receiverName, String receiverEmail, String receiverImage, String message) async{
    final Timestamp timestamp = Timestamp.now();

    ChatModel chatModel = ChatModel(
      senderId:  _auth.currentUser?.uid,
      senderEmail: user.email,
      senderImage: user.profilePicture,
      senderName: user.fullName,
      receiverId: receiverId,
      receiverName:  receiverName,
      receiverEmail: receiverEmail,
      receiverImage: receiverImage,
      message: message,
      timestamp: timestamp
    );

    List<String> ids = [_auth.currentUser!.uid,receiverId];
    ids.sort();
    String chatRoomId = ids.join("_");

    try{
      await firestore.collection('Chat').doc(chatRoomId).set({
        "id": chatRoomId
      }).then((value) => {

      });
      await firestore.collection('Chat').doc(chatRoomId).collection("messages").add(chatModel.toJson());
      print('Pesan berhasil dikirim!');
    }catch(e){
      throw Exception('Pesan gagal dikirim');
    }
  }

  Stream<QuerySnapshot> getMessages(String userId, String otherUserId){
    print(userId);
    List<String> ids = [userId,otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");

    return firestore.collection("Chat").doc(chatRoomId).collection("messages").orderBy("timestamp",descending: false).snapshots();
  }
}
