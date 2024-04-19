import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ta_ecommerce/view/admin/admin_merchant_profile.dart';
import '../../common/widgets/loaders/merchant_shimmer.dart';
import '../../common/widgets/merchant/merchant_card.dart';
import '../../controller/auth_controller/user_controller.dart';
import '../../controller/merchant_controller/merchant_controller.dart';
import '../../data/repositories/authentication_repository.dart';
import '../personalization/profile/profile.dart';
import 'admin_merchant_card.dart';

class HomeAdminScreen extends StatefulWidget {
  const HomeAdminScreen({Key? key}) : super(key: key);

  @override
  State<HomeAdminScreen> createState() => _HomeAdminScreenState();
}

class _HomeAdminScreenState extends State<HomeAdminScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false;

  void _registerUser() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email and password cannot be empty')),
      );
      return;
    }
    try {
      await AuthenticationRepository.instance.registerWithEmailAndPassword(email, password);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User registered successfully')),
      );
      Navigator.of(context).pop(); // Close the dialog after successful registration
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to register user: $e')),
      );
    }
  }

  void _showRegisterDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Register User'),
        content: SingleChildScrollView(
          // Added SingleChildScrollView to prevent overflow
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                ),
                obscureText: !_passwordVisible,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              _registerUser();
            },
            child: const Text('Register'),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Get.put(MerchantController());
    Get.put(UserController());
  }

  @override
  Widget build(BuildContext context) {
    final merchantController =
        Get.find<MerchantController>(); // Gunakan Get.find untuk mendapatkan instance yang sudah ada
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Users'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _showRegisterDialog,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() {
              if (merchantController.isLoading.value) {
                return const TMerchantShimmer();
              }
              if (merchantController.allMerchants.isEmpty) {
                return Center(
                    child: Text('Data Tidak Ditemukan!',
                        style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
              }

              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                // gri
                itemCount: merchantController.allMerchants.length,
                itemBuilder: (_, index) {
                  final merchant = merchantController.allMerchants[index];
                  return AdminMerchantCard(
                    merchant: merchant,
                    showBorder: true,
                    onTap: () => Get.to(() => AdminMerchantProfileScreen(merchant: merchant)),
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
