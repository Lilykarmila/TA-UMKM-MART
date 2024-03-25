import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ta_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ta_ecommerce/utils/constans/sizes.dart';
import 'package:ta_ecommerce/utils/constans/text_strings.dart';
import 'package:ta_ecommerce/utils/validators/validation.dart';

import '../../../../controller/update_name_controller.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Ubah Nama', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // headings
            Text(
              'Gunakan nama asli untuk verifikasi lebih mudah. Nama ini akan muncul di beberapa halaman.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: TSizes.spaceBtwSections),

            // text field and button
            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.fullName,
                    validator: (value) => TValidator.validateEmptyText('Full Name', value),
                    expands: false,
                    decoration: InputDecoration(labelText: TTexts.fulllName, prefixIcon: Icon(Iconsax.user)),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),

                  /// Save Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: () => controller.updateUserName(), child: Text('Simpan')),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
