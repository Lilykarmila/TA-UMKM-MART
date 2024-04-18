// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ta_ecommerce/common/widgets/loaders/loaders.dart';
// import 'package:ta_ecommerce/model/product_model.dart';
// import 'package:ta_ecommerce/utils/constans/enums.dart';
//
// import '../../data/repositories/product_repository.dart';
//
// class ProductController extends GetxController {
//   static ProductController get instance => Get.find();
//
//   final isLoading = false.obs;
//   final productRepository = Get.put(ProductRepository());
//   RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
//
//   @override
//   void onInit() {
//     fetchFeaturedProducts();
//     super.onInit();
//   }
//
//   /// fetch featued product from firestore
//   void fetchFeaturedProducts() async {
//     try {
//       // show loader while loading product
//       isLoading.value = true;
//
//       // fetch product
//       final products = await productRepository.getFeaturedProducts();
//
//       // assign products
//       featuredProducts.assignAll(products);
//     } catch (e) {
//       TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   /// fetch all product from firestore
//   Future<List<ProductModel>> fetchAllFeaturedProducts() async {
//     try {
//       // fetch product
//       final products = await productRepository.getAllFeaturedProducts();
//       return products;
//     } catch (e) {
//       TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
//       return [];
//     }
//   }
//
//   /// get the product price or price for varioations
//   String getProductPrice(ProductModel product) {
//     // If it's a single product, return its price
//
//     return product.price.toString();
//   }
//
//   Future<void> submitProduct(BuildContext context, ProductModel product) async {
//     try {
//       await productRepository.saveProduct(product);
//       // Optionally, you can show a success message or navigate to another screen.
//
//     } catch (e) {
//
//       print(e.toString());
//     }
//   }
// }
/// --------------
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_ecommerce/common/widgets/loaders/loaders.dart';
import 'package:ta_ecommerce/model/product_model.dart';
import 'package:ta_ecommerce/model/category_model.dart';
import 'package:ta_ecommerce/utils/constans/enums.dart';

import '../../data/repositories/product_repository.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  Rx<CategoryModel?> selectedCategory = Rx<CategoryModel?>(null);

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  /// fetch featured product from firestore
  void fetchFeaturedProducts() async {
    try {
      // show loader while loading product
      isLoading.value = true;

      // fetch product
      final products = await productRepository.getFeaturedProducts();

      // assign products
      featuredProducts.assignAll(products);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// fetch all product from firestore
  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      // fetch product
      final products = await productRepository.getAllFeaturedProducts();
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  /// get the product price or price for variations
  String getProductPrice(ProductModel product) {
    // If it's a single product, return its price
    return product.price.toString();
  }

  Future<void> submitProduct(BuildContext context, ProductModel product) async {
    try {
      await productRepository.saveProduct(product);
      // Optionally, you can show a success message or navigate to another screen.
    } catch (e) {
      print(e.toString());
    }
  }

  /// fetch category by id from firestore
  Future<List<ProductModel>> fetchCategoryById(String categoryId) async {
    try {
      // Ambil kategori berdasarkan categoryId
      final category = await productRepository.getCategoryById(categoryId);

      // Jika kategori ditemukan, ambil produk berdasarkan kategori
      if (category != null) {
        final products = await productRepository.getProductsByCategory(categoryId);
        return products;
      } else {
        // Jika kategori tidak ditemukan, kembalikan list kosong
        return [];
      }
    } catch (e) {
      // Tangani error
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }
}
