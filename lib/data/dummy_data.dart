import 'package:ta_ecommerce/model/merchant_model.dart';
import 'package:ta_ecommerce/model/user_model.dart';
import 'package:ta_ecommerce/utils/constans/image_strings.dart';

import '../model/category_model.dart';
import '../model/product_model.dart';

class TDummyData {
  /// -- Banners
  /// -- user
  // static final UserModel user = UserModel(
  //     id: id, fullName: n, username: username, email: email, profilePicture: profilePicture,);
  /// -- cart
  // static final CartModel cart = CartModel();
  /// -- order
  // static final List<OrderModel> orders = [];
  /// -- list of all categories
  static final List<CategoryModel> categories = [
    CategoryModel(id: '1', image: TImages.categoryFashion, name: 'Fashion', isFeatured: true),
    CategoryModel(id: '2', image: TImages.categoryKuliner, name: 'Kuliner', isFeatured: true),
    CategoryModel(id: '3', image: TImages.categoryOlehOleh, name: 'Jasa', isFeatured: true),
    CategoryModel(id: '4', image: TImages.categorySembako, name: 'Sembako', isFeatured: true),
    CategoryModel(id: '5', image: TImages.categoryFurniture, name: 'Furnitur', isFeatured: true),

    /// subcategories
    CategoryModel(id: '6', image: TImages.categoryFashion, name: 'Kemeja', parentId: '1', isFeatured: false),
    CategoryModel(id: '7', image: TImages.categoryFashion, name: 'Kemeja wanita', parentId: '1', isFeatured: false),

    /// furnitur
    CategoryModel(id: '8', image: TImages.categoryFurniture, name: 'Meja Rotan', parentId: '5', isFeatured: false),
    CategoryModel(id: '9', image: TImages.categoryFurniture, name: 'Oriflame', parentId: '5', isFeatured: false),
    CategoryModel(id: '10', image: TImages.categoryFurniture, name: 'Kursi Rotan   ', parentId: '5', isFeatured: false),
  ];

  /// list of all merchant
  // static final List<MerchantModel> merchant = [
  // MerchantModel(id: '1', image: TImages.merchant1, name: 'SweetStore', productsCount: 265, isFeatured: true),
// ]
  /// list of all merchant categories
  // static final List<MerchantCategoryModel> merchantCategory = [
  // MerchantCategoryModel(merchantId:'' categoryId:''); ]

  /// list of all product category
  // static final List<ProductCategoryModel> productCategories = [
  //   ProductCategoryModel(productId:'', categoryId:''),]

  /// list of all products
  static final List<ProductModel> product = [
    ProductModel(
      id: '001',
      title: 'Kemeja wanita',
      price: '55.000',
      isFeatured: true,
      thumbnail: TImages.productFashionKemeja1,
      description: 'Kemeja wanita kekinian',
      merchant: MerchantModel(id: '1', image: TImages.merchantLogo1, name: 'Sweet Store', isFeatured: true, type: ''),
      images: [TImages.productFashionKemeja1, TImages.productFashionKemeja2],
      categoryId: '1',
      productType: '',
    ),
  ];
}
