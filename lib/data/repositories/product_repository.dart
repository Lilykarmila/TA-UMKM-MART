import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ta_ecommerce/utils/exceptions/firebase_exceptions.dart';

import '../../model/product_model.dart';
import '../../utils/exceptions/platform_exceptions.dart';
import '../services/firebase_storage_service.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  /// Firestore instance for database interactions
  final _db = FirebaseFirestore.instance;
  final CollectionReference _productsCollection =
  FirebaseFirestore.instance.collection('Product');

  /// get limited featured product
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db.collection('Product').where('IsFeatured', isEqualTo: true).limit(4).get();
      // final snapshot = await _db.collection('Product').where('IsFeatured', isEqualTo: true).limit(4).get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  /// get limited featured product
  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db.collection('Product').where('IsFeatured', isEqualTo: true).get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  /// get products based on the query
  Future<List<ProductModel>> fetchProductByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList =
          querySnapshot.docs.map((doc) => ProductModel.fromQuerySnapshot(doc)).toList();
      return productList;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  Future<List<ProductModel>> getProductsForMerchant({required String merchantId, int limit = -1}) async {
    try {
      final querySnapshot = limit == -1
          ? await _db.collection('Product').where('Merchant.Id', isEqualTo: merchantId).get()
          : await _db.collection('Product').where('Merchant.Id', isEqualTo: merchantId).limit(limit).get();

      final products = querySnapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
      return products;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  /// upload dummy data  to the cloud firebase
  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      // upload all the product along with their images
      final storage = Get.put(TFirebaseStorageService());

      // loop through each product
      for (var product in products) {
        // get image data link from local assets
        final thumbnail = await storage.getImageDataFromAssets(product.thumbnail);

        // upload images and get its url
        final url = await storage.uploadImageData('Product/Images', thumbnail, product.thumbnail.toString());

        // assign URL to product.thumbnail atrribut
        product.thumbnail = url;

        // product list of images
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imagesUrl = [];
          for (var image in product.images!) {
            // get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(image);

            // upload image and get its url
            final url = await storage.uploadImageData('Product/Images', assetImage, image);

            // assign URL to product.thumbnail attribute
            imagesUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imagesUrl);
        }
        // store in firebase
        await _db.collection('Products').doc(product.id).set(product.toJson());
      }
    } on TFirebaseException catch (e) {
      throw e.message!;
    } on SocketException catch (e) {
      throw e.message!;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> saveProduct(ProductModel product) async {
    try {
      await _productsCollection.doc(product.id).set(product.toJson());
    } catch (e) {
      throw Exception('Failed to save product: $e');
    }
  }
}
