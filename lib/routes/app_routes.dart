import 'package:get/get_navigation/get_navigation.dart';
import 'package:ta_ecommerce/routes/routes.dart';
import 'package:ta_ecommerce/view/authentication/login/login.dart';
import 'package:ta_ecommerce/view/authentication/onboarding_screen/onboarding.dart';
import 'package:ta_ecommerce/view/authentication/password_configuration/forget_password.dart';
import 'package:ta_ecommerce/view/authentication/signup/signup.dart';
import 'package:ta_ecommerce/view/authentication/signup/verify_email.dart';
import 'package:ta_ecommerce/view/personalization/address/address.dart';
import 'package:ta_ecommerce/view/personalization/profile/profile.dart';
import 'package:ta_ecommerce/view/personalization/settings/settings.dart';
import 'package:ta_ecommerce/view/screens/cart/cart.dart';
import 'package:ta_ecommerce/view/screens/checkout/checkout.dart';
import 'package:ta_ecommerce/view/screens/home/home.dart';
import 'package:ta_ecommerce/view/screens/orders/order.dart';
import 'package:ta_ecommerce/view/screens/store/store.dart';
import 'package:ta_ecommerce/view/screens/wishlist/wishlist.dart';

import '../view/screens/all_products/product_reviews/product_reviews.dart';
import '../view/screens/all_products/product_input/product_input.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: TRoutes.home, page: () => const HomeScreen()),
    GetPage(name: TRoutes.store, page: () => const StoreScreen()),
    GetPage(name: TRoutes.favourites, page: () => const FavouriteScreen()),
    GetPage(name: TRoutes.settings, page: () => const SettingsScreen()),
    GetPage(name: TRoutes.productReviews, page: () => const ProductReviewScreen()),
    GetPage(name: TRoutes.order, page: () => const OrderScreen()),
    GetPage(name: TRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: TRoutes.cart, page: () => const CartScreen()),
    GetPage(name: TRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: TRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: TRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: TRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: TRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: TRoutes.forgetPassword, page: () => const ForgetPassword()),
    GetPage(name: TRoutes.onBoarding, page: () => const OnBoardingScreen()),
    GetPage(name: TRoutes.addProducts, page: () => const ProductInputPage()),
  ];
}
