// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:ta_ecommerce/common/widgets/loaders/loaders.dart';
// import 'package:ta_ecommerce/data/repositories/product_repository.dart';
// import 'package:ta_ecommerce/model/product_model.dart';
//
// import '../../data/repositories/merchant_repository.dart';
// import '../../model/merchant_model.dart';
//
// class MerchantController extends GetxController {
//   static MerchantController get instance => Get.find();
//
//   RxBool isLoading = true.obs;
//   final RxList<MerchantModel> allMerchants = <MerchantModel>[].obs;
//   final RxList<MerchantModel> featuredMerchants = <MerchantModel>[].obs;
//   final merchantRepository = Get.put(MerchantRepository());
//
//   @override
//   void onInit() {
//     getFeaturedMerchants();
//     super.onInit();
//   }
//
//   /// -- Load merchants
//   Future<void> getFeaturedMerchants() async {
//     try {
//       // show loader while loading merchants
//       isLoading.value = true;
//
//       final merchants = await merchantRepository.getAllMerchants();
//
//       allMerchants.assignAll(merchants as Iterable<MerchantModel>);
//       featuredMerchants.assignAll(allMerchants.where((merchant) => merchant.isFeatured ?? false).take(4));
//     } catch (e) {
//       TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
//     } finally {
//       // stop loader
//       isLoading.value = false;
//     }
//   }
//
//   /// -- get merchant for category
//
//   /// -- get merchant specific products from your data source
//   Future<List<ProductModel>> getMerchantProducts(String merchantId) async {
//     try {
//       final products = await ProductRepository.instance.getProductsForMerchant(merchantId: merchantId);
//       return products;
//     } catch (e) {
//       TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
//
//       return [];
//     }
//   }
// }

/// ////////////////////////
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ta_ecommerce/common/widgets/loaders/loaders.dart';
import 'package:ta_ecommerce/data/repositories/product_repository.dart';
import 'package:ta_ecommerce/model/product_model.dart';

import '../../data/repositories/merchant_repository.dart';
import '../../model/merchant_model.dart';

class MerchantController extends GetxController {
  static MerchantController get instance => Get.find();

  RxBool isLoading = true.obs;
  final RxList<MerchantModel> allMerchants = <MerchantModel>[].obs;
  final RxList<MerchantModel> featuredMerchants = <MerchantModel>[].obs;
  final merchantRepository = Get.put(MerchantRepository());

  @override
  void onInit() {
    getFeaturedMerchants();
    super.onInit();
  }

  /// -- Load merchants
  Future<void> getFeaturedMerchants() async {
    try {
      // show loader while loading merchants
      isLoading.value = true;

      final merchants = await merchantRepository.getAllMerchants();

      // Hapus data user selain type: merchant
      merchants.retainWhere((merchant) => merchant.type == 'merchant');

      allMerchants.assignAll(merchants as Iterable<MerchantModel>);
      // featuredMerchants.assignAll(allMerchants.where((merchant) => merchant.isFeatured ?? false).take(4));
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // stop loader
      isLoading.value = false;
    }
  }

  /// -- get merchant for category

  /// -- get merchant specific products from your data source
  Future<List<ProductModel>> getMerchantProducts(String merchantId) async {
    try {
      final products = await ProductRepository.instance.getProductsForMerchant(merchantId: merchantId);
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());

      return [];
    }
  }
}
