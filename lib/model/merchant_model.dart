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
  String image;
  String? type;
  bool? isFeatured;
  String? description;
  // int? productsCount;

  MerchantModel(
      {required this.id, required this.image, required this.name, this.isFeatured, this.description, this.type});

  /// empty helper function
  static MerchantModel empty() => MerchantModel(id: '', image: '', name: '', type: '');

  /// convert model to json structure so that you can store ata in firebase
  toJson() {
    return {
      'Uid': id,
      'FullName': name,
      'Type': type,
      'ProfilePicture': image,
    };
  }

  /// map json oriented document snapshot from firebase to UserModel
  factory MerchantModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return MerchantModel.empty();
    return MerchantModel(
      id: data['Uid'] ?? '',
      name: data['FullName'] ?? '',
      image: data['ProfilePicture'] ?? '',
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
        name: data['FullName'] ?? '',
        type: data['Type'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
        description: data['Description'] ?? '',
      );
    }
    return MerchantModel.empty();
  }
}
