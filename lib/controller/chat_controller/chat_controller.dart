import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
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
  final apiUrl = 'https://b027-180-251-144-211.ngrok-free.app/api/encrypt';

  // void sendMessages(
  //     String receiverId, String receiverName, String receiverEmail, String receiverImage, String message) async {
  //   try {
  //     //   var url = Uri.parse('$apiUrl/api/v1/merchants');
  //     // var response = await http.get(url);
  //     UserModel user = await uRepo.fetchUserDetails();
  //     print(user.uid);
  //     repository.sendMessages(user, receiverId, receiverName, receiverEmail, receiverImage, message);
  //   } catch (e) {
  //     throw e.toString();
  //   }
  // }

  /// =============================================================================================
  void sendMessages(
      String receiverId, String receiverName, String receiverEmail, String receiverImage, String message) async {
    try {
      // Get the user details
      UserModel user = await uRepo.fetchUserDetails();
      print(user.uid);

      var key = "";
      if (user.type == "user") {
        key = user.uid.substring(0, 8) + receiverId.substring(0, 8);
      } else {
        key = receiverId.substring(0, 8) + user.uid.substring(0, 8);
      }

      print("key:" + key);

      // Construct the request body
      var requestBody = {
        'plaintext': message,
        'key': key,
      };

      // Send the POST request to Firestore endpoint
      var url = Uri.parse('https://b027-180-251-144-211.ngrok-free.app/api/encrypt');
      var response = await http.post(
        url,
        body: requestBody,
      );

      // Check the response status
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        repository.sendMessages(user, receiverId, receiverName, receiverEmail, receiverImage, jsonResponse['output']);
      } else {
        throw 'Failed to send message: ${response.statusCode}';
      }
    } catch (e) {
      throw e.toString();
    }
  }

  /// ==========================================================================

  // Stream<QuerySnapshot>? getMessages(String userId, String otherUserId) {
  //   try {
  //     if (userId == "" || otherUserId == "") return null;
  //     final messages = repository.getMessages(userId, otherUserId);
  //     print("Messages:" + messages.toString());
  //     return messages;
  //   } catch (e) {
  //     return null;
  //   }
  // }

  Stream<QuerySnapshot>? getMessages(String userId, String otherUserId) {
    try {
      if (userId == "" || otherUserId == "") return null;
      final messages = repository.getMessages(userId, otherUserId);
      print("Messages:" + messages.toString());

      // Your Firestore endpoint URL
      var url = 'https://b027-180-251-144-211.ngrok-free.app/api/decrypt';

      // Example data to send to Firestore
      Map<String, dynamic> data = {
        'ciphertext': messages,
        'key': userId.substring(0, 8) + otherUserId.substring(0, 8),
      };

      // Send a POST request to the Firestore endpoint
      http.post(Uri.parse(url), body: data).then((response) {
        // Handle the response here
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }).catchError((error) {
        // Handle any errors
        print('Error: $error');
      });

      return messages;
    } catch (e) {
      return null;
    }
  }

  String getLoginId() {
    return firebase.currentUser != null ? firebase.currentUser!.uid : "";
  }

  Stream<List<UserModel>> getListChatFromUserLogin(String userId) {
    try {
      print(userId + " lala");
      final list = repository.getListChatFromUserLogin(userId);
      return list;
    } catch (e) {
      rethrow;
    }
  }
}
