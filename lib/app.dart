import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_ecommerce/bindings/general_binding.dart';
import 'package:ta_ecommerce/routes/app_routes.dart';
import 'package:ta_ecommerce/utils/constans/colors.dart';
import 'package:ta_ecommerce/utils/theme/theme.dart';
import 'package:ta_ecommerce/view/authentication/onboarding_screen/onboarding.dart';

class UmkmApp extends StatelessWidget {
  const UmkmApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      home: const Scaffold(
          backgroundColor: TColors.primaryColor,
          body: Center(child: CircularProgressIndicator(color: Colors.black))),
    );
  }
}
