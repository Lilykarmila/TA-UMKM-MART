
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ta_ecommerce/model/category_model.dart';
import 'package:ta_ecommerce/utils/exceptions/firebase_exceptions.dart';
import 'package:ta_ecommerce/utils/exceptions/platform_exceptions.dart';

import '../services/firebase_storage_service.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  /// variables
  final _db = FirebaseFirestore.instance;

  ///  Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  ///  Get Sub categories
  ///  Upload categories to the cloud firebase
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      // upload all the categories along with their images
      final storage = Get.put(TFirebaseStorageService());

      // loop through each category
      for (var category in categories) {
        // get ImageData link from the local assets
        final file = await storage.getImageDataFromAssets(category.image);

        // upload image and get its URL
        final url = await storage.uploadImageData('Categories', file, category.name);

        // assign URL to category.image attribute
        category.image = url;

        // store category in Firestore
        await _db.collection('Categories').doc(category.id).set(category.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }
}
