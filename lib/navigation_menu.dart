import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ta_ecommerce/utils/constans/colors.dart';
import 'package:ta_ecommerce/utils/helper/helper_functions.dart';
import 'package:ta_ecommerce/view/chat/chat.dart';
import 'package:ta_ecommerce/view/personalization/settings/settings.dart';
import 'package:ta_ecommerce/view/screens/all_products/product_input/product_input.dart';
import 'package:ta_ecommerce/view/screens/store/store.dart';

import 'view/screens/home/home.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);

    return SafeArea(
      child: Scaffold(
        body: Obx(
              () => controller.screensFuture.isNotEmpty
              ? _buildNavigationScaffold(controller, darkMode)
              : const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }

  Widget _buildNavigationScaffold(NavigationController controller, bool darkMode) {
    return Scaffold(
      bottomNavigationBar: Obx(
            () {
          final List<NavigationDestination> destinations =
              controller.destinations.value;
          return NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) {
              controller.selectedIndex.value = index;
            },
            backgroundColor: darkMode ? TColors.black : Colors.white,
            indicatorColor: darkMode
                ? TColors.white.withOpacity(0.1)
                : TColors.black.withOpacity(0.1),
            destinations: destinations,
          );
        },
      ),
      body: Obx(
            () => controller.screensFuture.isNotEmpty
            ? controller.screensFuture[controller.selectedIndex.value]
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}




class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final RxList<NavigationDestination> destinations = <NavigationDestination>[].obs;
  final RxList<Widget> screensFuture = <Widget>[].obs;

  NavigationController() {
    initializeScreens();
    getDestinations(); // Call getDestinations here to fetch destinations
  }

  // Future<void> initializeScreens() async {
  //   screensFuture = getScreens();
  // }

  Future<void> initializeScreens() async {
    List<Widget> screens = await getScreens(); // Await the result here
    screensFuture.value = screens; // Assign the screens to screensFuture
  }

  Future<String?> getUserType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString('type');
    return value;
  }

  Future<void> getDestinations() async {
    String? userType = await getUserType();
    List<NavigationDestination> destinationsList = [
      const NavigationDestination(icon: Icon(Iconsax.home), label: 'Beranda'),
      const NavigationDestination(icon: Icon(Iconsax.shop), label: 'Toko'),
      const NavigationDestination(icon: Icon(Iconsax.message), label: 'Chat'),
      const NavigationDestination(icon: Icon(Iconsax.user), label: 'Profil'),
    ];

    if (userType == "merchant") {
      destinationsList = [
        const NavigationDestination(icon: Icon(Iconsax.home), label: 'Beranda'),
        const NavigationDestination(icon: Icon(Iconsax.message), label: 'Chat'),
        const NavigationDestination(icon: Icon(Iconsax.user), label: 'Profil'),
      ];
    }

    destinations.value = destinationsList;
  }

  Future<List<Widget>> getScreens() async {
    List<Widget> screens = [
      const HomeScreen(),
      const StoreScreen(),
      const ChatScreen(),
      const SettingsScreen(),
    ];
    String? userType = await getUserType();

    if (userType == "merchant") {
      screens = [
        const ProductInputPage(),
        const ChatScreen(),
        const SettingsScreen(),
      ];
    }

    return screens;
  }
}
