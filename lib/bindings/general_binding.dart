import 'package:get/get.dart';
import 'package:ta_ecommerce/utils/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
