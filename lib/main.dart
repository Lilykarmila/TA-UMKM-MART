import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';
import 'data/repositories/authentication_repository.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  /// --- Add Widgets Binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// --- GetX Local Storage
  await GetStorage.init();

  /// --- Await Native Splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// --- Initialize Firebase & Aunthentication Repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  // load all material design, theme etc
  runApp(const UmkmApp());
}
