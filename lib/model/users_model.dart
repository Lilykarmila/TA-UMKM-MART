// // To parse this JSON data, do
// //
// //     final usersModel = usersModelFromJson(jsonString);
//
// import 'dart:convert';
//
// UsersModel usersModelFromJson(String str) => UsersModel.fromJson(json.decode(str));
//
// String usersModelToJson(UsersModel data) => json.encode(data.toJson());
//
// class UsersModel {
//   String? uid;
//   String? name;
//   String? userName;
//   String? email;
//   String? creationTime;
//   String? lastSignInTime;
//   String? photoUrl;
//   String? updateTime;
//   List<Chat>? chats;
//
//   UsersModel({
//     this.uid,
//     this.name,
//     this.userName,
//     this.email,
//     this.creationTime,
//     this.lastSignInTime,
//     this.photoUrl,
//     this.updateTime,
//     this.chats,
//   });
//
//   factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
//         uid: json["uid"],
//         name: json["name"],
//         userName: json["userName"],
//         email: json["email"],
//         creationTime: json["creationTime"],
//         lastSignInTime: json["lastSignInTime"],
//         photoUrl: json["photoUrl"],
//         updateTime: json["updateTime"],
//         chats: List<Chat>.from(json["chats"].map((x) => Chat.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "uid": uid,
//         "name": name,
//         "userName": userName,
//         "email": email,
//         "creationTime": creationTime,
//         "lastSignInTime": lastSignInTime,
//         "photoUrl": photoUrl,
//         "updateTime": updateTime,
//         "chats": List<dynamic>.from(chats!.map((x) => x.toJson())),
//       };
// }
//
// class Chat {
//   String? connection;
//   String? chatId;
//   String? lastTime;
//
//   Chat({
//     this.connection,
//     this.chatId,
//     this.lastTime,
//   });
//
//   factory Chat.fromJson(Map<String, dynamic> json) => Chat(
//         connection: json["connection"],
//         chatId: json["chat_id"],
//         lastTime: json["lastTime"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "connection": connection,
//         "chat_id": chatId,
//         "lastTime": lastTime,
//       };
// }
