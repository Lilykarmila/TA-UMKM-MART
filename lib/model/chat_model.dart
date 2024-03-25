
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ta_ecommerce/model/product_model.dart';
import 'package:ta_ecommerce/model/user_model.dart';

// class ChatModel {
//   String? chat;
//   int? userId;
//   String? userName;
//   String? userImage;
//   String? sender;
//   bool? isFromUser;
//   // ProductModel? product;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//
//   ChatModel({
//     // this.chat,
//     this.userId,
//     this.userName,
//     this.userImage,
//     this.sender,
//     this.isFromUser,
//     // this.product,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   static ChatModel empty() => ChatModel(chat: );
//
//   ChatModel.fromJson(Map<String, dynamic> json) {
//     chat = json['chat'];
//     userId = json['userId'];
//     userName = json['userName'];
//     userImage = json['userImage'];
//     sender = json['sender'];
//     isFromUser = json['isFromUser'];
//     // product = json['product'] == {} ? UninitializedProductModel() : ProductModel.fromJson(json['product']);
//     createdAt = DateTime.parse(json['createdAt']);
//     updatedAt = DateTime.parse(json['updatedAt']);
//   }
//   Map<String, dynamic> toJson() {
//     return {
//       'chat': chat,
//       'userId': userId,
//       'userName': userName,
//       'userImage': userImage,
//       'isFromUser': isFromUser,
//       // 'product': product is UninitializedProductModel ? {} : product?.toJson(),
//       'createdAt': createdAt?.toIso8601String(),
//       'updatedAt': updatedAt?.toIso8601String(),
//     };
//   }
//
//   factory ChatModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
//     if (document.data() == null) return ChatModel.empty();
//     final data = document.data()!;
//     return ChatModel(
//       id: document.id,
//       title: data['Title'],
//       isFeatured: data['IsFeatured'] ?? false,
//       price: data['Price'] ?? '',
//       // price: double.parse((data['Price'] ?? 0.0).toString()),
//       thumbnail: data['Thumbnail'] ?? '',
//       categoryId: data['CategoryId'] ?? '',
//       description: data['Description'] ?? '',
//       productType: data['ProductType'] ?? '',
//       merchant: MerchantModel.fromJson(data['Merchant']),
//       images: data['Images'] != null ? List<String>.from(data['Images']) : [],
//     );
//   }
// }

class ChatModel {
  final String? senderId;
  final String? senderEmail;
  final String? senderName;
  final String? senderImage;
  final String? receiverId;
  final String? receiverEmail;
  final String? receiverName;
  final String? receiverImage;
  final String? message;
  final Timestamp? timestamp;

  ChatModel({
    // this.chat,
    this.senderId,
    this.senderEmail,
    this.senderName,
    this.senderImage,
    this.receiverId,
    this.receiverEmail,
    this.receiverName,
    this.receiverImage,
    this.message,
    this.timestamp
  });

  Map<String, dynamic> toJson() {
    return {
      'senderId': senderId,
      'senderEmail': senderEmail,
      'senderName': senderName,
      'senderImage': senderImage,
      'receiverId': receiverId,
      'receiverEmail': receiverEmail,
      'receiverName': receiverName,
      'receiverImage': receiverImage,
      'message': message,
      'timestamp': timestamp,
    };
  }
  static ChatModel empty() => ChatModel(senderId: '', senderEmail: '', senderName: '', senderImage: '', receiverId: '',receiverName: '',receiverEmail: '',receiverImage:'' ,message: '',timestamp: Timestamp.now());
  factory ChatModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return ChatModel.empty();
    final data = document.data()!;
    return ChatModel(
      senderId: data['senderId'],
      senderEmail: data['senderEmail'],
      senderName: data['senderName'],
      senderImage: data['senderImage'] ?? '',
      receiverId: data['receiverId'] ?? '',
      receiverEmail: data['receiverEmail'] ?? '',
      receiverName: data['receiverName'] ?? '',
      receiverImage: data['receiverImage'] ?? '',
      message: data['message'] ?? '',
      timestamp: data['timestamp'] ?? Timestamp.now(),
    );
  }

}