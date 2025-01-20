import 'package:cloud_firestore/cloud_firestore.dart';

import 'merchant_model.dart';

class ProductModel {
  String id;
  String price;
  // Double price;
  String title;
  String thumbnail;
  bool? isFeatured;
  MerchantModel? merchant;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.thumbnail,
    required this.productType,
    this.merchant,
    this.images,
    this.isFeatured,
    this.categoryId,
    this.description,
  });

  /// create empty func fir clean code
  static ProductModel empty() => ProductModel(id: '', title: '', price: '', thumbnail: '', productType: '');

  /// Json Format
  toJson() {
    return {
      'Title': title,
      'Price': price,
      'Images': images ?? [],
      'Thumbnail': thumbnail,
      'IsFeatured': isFeatured,
      'CategoryId': categoryId,
      'Merchant': merchant!.toJson(),
      'Description': description,
      'ProductType': productType,
    };
  }

  /// Map Json oriented document snapshot from firebase to model
  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return ProductModel.empty();
    final data = document.data()!;
    return ProductModel(
      id: document.id,
      title: data['Title'],
      isFeatured: data['IsFeatured'] ?? false,
      price: data['Price'] ?? '',
      // price: double.parse((data['Price'] ?? 0.0).toString()),
      thumbnail: data['Thumbnail'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      description: data['Description'] ?? '',
      productType: data['ProductType'] ?? '',
      merchant: MerchantModel.fromJson(data['Merchant']),
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
    );
  }

  // map json-oriented document snapshot firebase to model
  factory ProductModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return ProductModel(
      id: document.id,
      title: data['Title'] ?? '',
      isFeatured: data['IsFeatured'] ?? false,
      price: data['Price'] ?? '',
      // price: double.parse((data['Price'] ?? 0.0).toString()),
      thumbnail: data['Thumbnail'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      description: data['Description'] ?? '',
      productType: data['ProductType'] ?? '',
      merchant: MerchantModel.fromJson(data['Merchant']),
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
    );
  }
// factory ProductModel fromQuery Snapshot(QueryDocumentSnapshot<Object?> documentSnapshot){}
}

// class ProductModel {
//   String id;
//   int stock;
//   String? sku;
//   double price;
//   String title;
//   DateTime? date;
//   double salePrice;
//   String thumbnail;
//   bool? isFeatured;
//   MerchantModel? merchant;
//   String? description;
//   String? categoryId;
//   List<String>? images;
//   String productType;
//   List<ProductAttributeModel>? productAttributes;
//
//   ProductModel({
//     required this.id,
//     required this.title,
//     required this.stock,
//     required this.price,
//     required this.thumbnail,
//     required this.productType,
//     this.sku,
//     this.merchant,
//     this.date,
//     this.images,
//     this.salePrice = 0.0,
//     this.isFeatured,
//     this.categoryId,
//     this.description,
//     this.productAttributes,
//   });
//
//   /// create empty func fir clean code
//   static ProductModel empty() => ProductModel(id: '', title: '', stock: 0, price: 0, thumbnail: '');
//
//   /// Json Format
//   toJson() {
//     return {
//       'SKU': sku,
//       'Title': title,
//       'Stock': stock,
//       'Price': price,
//       'Images': images ?? [],
//       'Thumbnail': thumbnail,
//       'SalePrice': salePrice,
//       'IsFeatured': isFeatured,
//       'CategoryId': categoryId,
//       'Merchant': merchant!.toJson(),
//       'Description': description,
//       // 'ProductType': productType,
//       // 'ProductAttributes': productAttributesributes != null ? productAttributes!.map((e) => e.toJson()).toList() : [],
//     };
//   }
//
//   /// Map Json oriented document snapshot from firebase to model
//   factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
//     if (document.data() == null) return ProductModel.empty();
//     final data = document.data()!;
//     return ProductModel(
//       id: document.id,
//       sku: data['SKU'],
//       title: data['Title'],
//       stock: data['Stock'] ?? 0,
//       isFeatured: data['IsFeatured'] ?? false,
//       price: double.parse((data['Price'] ?? 0.0).toString()),
//       salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
//       thumbnail: data['Thumbnail'] ?? '',
//       categoryId: data['CategoryId'] ?? '',
//       description: data['Description'] ?? '',
//       // productType: data['ProductType'] ?? '',
//       merchant: MerchantModel.fromJson(data['Merchant']),
//       images: data['Images'] != null ? List<String>.from(data['Images']) : [],
//       // productAttributes:
//       //     (data['ProductAttributes'] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e)).toList(),
//     );
//   }
//
// // map json-oriented document snapshot firebase to model
// // factory ProductModel fromQuery Snapshot(QueryDocumentSnapshot<Object?> documentSnapshot){}
// }

class UninitializedProductModel extends ProductModel {
  UninitializedProductModel(
      {required super.id,
      required super.title,
      required super.price,
      required super.thumbnail,
      required super.productType});
}
