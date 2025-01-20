import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ta_ecommerce/utils/constans/sizes.dart';
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
  final TextEditingController _usernameControllerr = TextEditingController();
  bool _passwordVisible = false;

  void _registerUser() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String username = _usernameControllerr.text.trim();

    if (email.isEmpty || password.isEmpty || username.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Username, email, and password cannot be empty')),
      );
      return;
    }

    try {
      // Mendaftarkan pengguna
      UserCredential userCredential =
          await AuthenticationRepository.instance.registerWithEmailAndPassword(email, password);

      // Waktu saat ini
      Timestamp currentTime = Timestamp.now();

      // Menyimpan informasi pengguna ke Firestore
      await FirebaseFirestore.instance.collection('Users').doc(userCredential.user!.uid).set({
        'Username': username,
        'Email': email,
        'FullName': username, // Anda dapat mengganti ini dengan nama lengkap jika diperlukan
        'ProfilePicture': '', // URL gambar profil, jika ada
        'Type': 'merchant',
        'Uid': userCredential.user!.uid,
        'CreationTime': currentTime,
        'LastSignIn': currentTime,
        'UpdateTime': currentTime,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User registered successfully')),
      );
      // Refresh data setelah pendaftaran berhasil
      Get.find<MerchantController>().fetchAllMerchants();
      Navigator.of(context).pop(); // Tutup dialog setelah pendaftaran berhasil
    } catch (e) {
      print('Exception caught: $e'); // Tambahkan baris ini
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
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _usernameControllerr,
              decoration: const InputDecoration(labelText: 'Username'),
              keyboardType: TextInputType.name,
            ),
            SizedBox(height: TSizes.spaceBtwItem),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: TSizes.spaceBtwItem),
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

  Widget build(BuildContext context) {
    final merchantController = Get.find<MerchantController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kelola User'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _showRegisterDialog,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace / 2),
        child: ListView(
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
                itemCount: merchantController.allMerchants.length,
                itemExtent: 90, // Tinggi tetap untuk setiap item
                itemBuilder: (_, index) {
                  final merchant = merchantController.allMerchants[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0), // Jarak vertikal antar card
                    child: AdminMerchantCard(
                      merchant: merchant,
                      showBorder: true,
                      onTap: () => Get.to(() => AdminMerchantProfileScreen(merchant: merchant)),
                    ),
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
