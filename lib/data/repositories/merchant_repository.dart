import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ta_ecommerce/model/merchant_model.dart';
import 'package:ta_ecommerce/utils/exceptions/format_exceptions.dart';

import '../../model/user_model.dart';
import '../../utils/exceptions/firebase_exceptions.dart';
import '../../utils/exceptions/platform_exceptions.dart';

class MerchantRepository extends GetxController {
  static MerchantRepository get instance => Get.find();

  // variable
  final _db = FirebaseFirestore.instance;

  // get all categories
  Future<List<MerchantModel>> getAllMerchants() async {
    try {
      final snapshot = await _db.collection('Users').get();
      final result = snapshot.docs.map((e) => MerchantModel.fromSnapshot(e)).toList();
      return result;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  Future<List<UserModel>> getAllUser() async {
    try {
      final snapshot = await _db.collection('Users').get();
      final result = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
      return result;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  Future<UserModel?> getFilteredMerchants(String id) async {
    try {
      UserModel? m;
      final list = await getAllUser();
      for (int i = 0; i < list.length; i++) {
        print("jennoi item ${list[i].uid} ${list[i].username}");
        if (list[i].uid == id) {
          m = list[i];
          break;
        }
      }
      // list.then((value) => {
      //   value.map((e) => {
      //     print("list mer jennoi ${e}"),
      //     if (e.id == id){
      //       print("list mer e ${e}"),
      //       m = e
      //     }
      //   })
      // });
      return m;
    } catch (e) {
      rethrow;
    }
  }
  // get merchants for category
}
