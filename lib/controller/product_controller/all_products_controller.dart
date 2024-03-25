import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ta_ecommerce/common/widgets/loaders/loaders.dart';
import 'package:ta_ecommerce/data/repositories/product_repository.dart';
import 'package:ta_ecommerce/model/product_model.dart';

class AllProductsController extends GetxController {
  static AllProductsController get instance => Get.find();

  final repository = ProductRepository.instance;
  final RxString selectedSortOption = 'Name'.obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;

  Future<List<ProductModel>> fetchProductByQuery(Query? query) async {
    try {
      if (query == null) return [];

      final products = await repository.fetchProductByQuery(query);
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      return [];
    }
  }

  void sortProducts(String sortOption) {
    selectedSortOption.value = sortOption;

    switch (sortOption) {
      case 'Nama':
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Tertinggi':
        products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'Terendah':
        products.sort((a, b) => a.price.compareTo(b.price));
        break;
      default:
        // default sorting option : name
        products.sort((a, b) => a.title.compareTo(b.title));
    }
  }

  void assignProducts(List<ProductModel> products) {
    // assign products to the 'products' list
    this.products.assignAll(products);
    sortProducts('Nama');
  }
}
