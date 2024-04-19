// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class MerchantModel {
//   String id;
//   String name;
//   String image;
//   bool? isFeatured;
//   String? description;
//   // int? productsCount;
//
//   MerchantModel({required this.id, required this.image, required this.name, this.isFeatured, this.description});
//
//   /// empty helper function
//   static MerchantModel empty() => MerchantModel(id: '', image: '', name: '');
//
//   /// convert model to json structure so that you can store ata in firebase
//   toJson() {
//     return {
//       'Id': id,
//       'Name': name,
//       'Image': image,
//       'IsFeatured': isFeatured,
//       'Description': description,
//     };
//   }
//
//   /// map json oriented document snapshot from firebase to UserModel
//   factory MerchantModel.fromJson(Map<String, dynamic> document) {
//     final data = document;
//     if (data.isEmpty) return MerchantModel.empty();
//     return MerchantModel(
//       id: data['Id'] ?? '',
//       name: data['Name'] ?? '',
//       image: data['Image'] ?? '',
//       isFeatured: data['IsFeatured'] ?? false,
//       description: data['Description'] ?? '',
//     );
//   }
//
//   /// map json oriented document snapshot from firebase to usermodel
//   factory MerchantModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
//     if (document.data() != null) {
//       final data = document.data()!;
//
//       // map JSON record to the model
//       return MerchantModel(
//         id: document.id,
//         image: data['Image'] ?? '',
//         name: data['Name'] ?? '',
//         isFeatured: data['IsFeatured'] ?? false,
//         description: data['Description'] ?? '',
//       );
//     }
//     return MerchantModel.empty();
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';

class MerchantModel {
  String id;
  String name;
  String email;
  String image;
  String type;
  bool? isFeatured;
  String? description;
  // int? productsCount;

  MerchantModel(
      {required this.id,
      required this.image,
      required this.name,
      required this.email,
      this.isFeatured,
      this.description,
      required this.type});

  /// empty helper function
  static MerchantModel empty() => MerchantModel(id: '', image: '', name: '', type: '', email: '');

  /// convert model to json structure so that you can store ata in firebase
  toJson() {
    return {
      'Id': id,
      'FullName': name,
      'Email': email,
      'IsFeatured': isFeatured,
      'Description': description,
      'Type': type,
      'ProfilePicture': image,
      // 'ProfilePicture': profilPicture,
    };
  }

  /// map json oriented document snapshot from firebase to UserModel
  factory MerchantModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return MerchantModel.empty();
    return MerchantModel(
      id: data['Id'] ?? '',
      name: data['FullName'] ?? '',
      email: data['Email'] ?? '',
      image: data['ProfilePicture'] ?? '',
      // profilPicture: data['ProfilePicture'] ?? '',
      type: data['type'] ?? '',
      isFeatured: data['IsFeatured'] ?? false,
      description: data['Description'] ?? '',
    );
  }

  /// map json oriented document snapshot from firebase to usermodel
  factory MerchantModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      // map JSON record to the model
      print("Data document: " + document.id);
      return MerchantModel(
        id: document.id,
        image: data['ProfilePicture'] ?? '',
        // profilPicture: data['ProfilePicture'] ?? '',
        name: data['FullName'] ?? '',
        email: data['Email'] ?? '',
        type: data['Type'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
        description: data['Description'] ?? '',
      );
    }
    return MerchantModel.empty();
  }
}
