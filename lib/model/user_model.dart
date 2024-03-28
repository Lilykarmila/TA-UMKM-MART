import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

/// model class respresenting user data
class UserModel {
  final String uid;
  String profilePicture;
  String fullName;
  final String username;
  final String email;
  String? creationTime;
  String? lastSignInTime;
  String? type;
  String? updateTime;
  // List<Chat>? chats;

  /// constructor for usermodel
  UserModel({
    required this.uid,
    required this.fullName,
    required this.username,
    required this.email,
    required this.profilePicture,
    this.creationTime,
    this.lastSignInTime,
    this.type,
    this.updateTime,
    // this.chats,
  });

  ///---------------------------- helper function to  get the full name
  String get fullNames => '$fullName';

  ///----------------------------- static function to split full name
  static String nameParts(fullNames) => fullNames.split("");

  ///---------------------------- static function to generate a username from the full name.
  static String generateUsername(fullNames) {
    String nameParts = fullNames.split(" ");
    String fullName = nameParts[0].toLowerCase();

    String camelCaseUsername = fullName;
    String usernameWithPrefix = "lyk_$camelCaseUsername";
    return usernameWithPrefix;
  }

  /// static function to create an empty user model.
  static UserModel empty() => UserModel(
        uid: '',
        fullName: '',
        username: '',
        email: '',
        profilePicture: '',
        creationTime: '',
        lastSignInTime: '',
        updateTime: '',
        // chats: [],
      );

  /// convert model to JSON structure for data in firebase.
  Map<String, dynamic> toJson() {
    return {
      "Uid": uid,
      'FullName': fullName,
      'Username': username,
      'Email': email,
      'ProfilePicture': profilePicture,
      'CreationTime': creationTime,
      'LastSignInTime': lastSignInTime,
      'UpdateTime': updateTime,
      "Type": type
      // 'Chats': chats?.map((chat) => chat.toJson()).toList ?? [],
    };
  }

  /// factory method to create a UserModel from a firebase document snapshot
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
          uid: data['Uid'] ?? '',
          fullName: data['FullName'] ?? '',
          username: data['Username'] ?? '',
          email: data['Email'] ?? '',
          profilePicture: data['ProfilePicture'] ?? '',
          creationTime: data['CreationTime'],
          lastSignInTime: data['LastSignInTime'],
          updateTime: data['UpdateTime'] ?? '',
          type: data["Type"]
          // chats: (data?['Chats'] as List<dynamic>?)?.map((chat) => Chat.fromJson(chat)).toList(),
          );
    }
    return UserModel.empty();
  }
}

class Chat {
  String? connection;
  String? chatId;
  String? lastTime;

  Chat({
    this.connection,
    this.chatId,
    this.lastTime,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        connection: json["connection"],
        chatId: json["chat_id"],
        lastTime: json["lastTime"],
      );

  Map<String, dynamic> toJson() => {
        "connection": connection,
        "chat_id": chatId,
        "lastTime": lastTime,
      };
}
