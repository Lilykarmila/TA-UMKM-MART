import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ta_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ta_ecommerce/controller/update_username_controller.dart';
import 'package:ta_ecommerce/utils/constans/sizes.dart';
import 'package:ta_ecommerce/utils/constans/text_strings.dart';
import 'package:ta_ecommerce/utils/validators/validation.dart';

import '../../../../controller/update_name_controller.dart';

// class ChangeUsername extends StatelessWidget {
//   const ChangeUsername({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(UpdateUsernameController());
//     return Scaffold(
//       appBar: TAppBar(
//         showBackArrow: true,
//         title: Text('Ubah Username', style: Theme.of(context).textTheme.headlineSmall),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(TSizes.defaultSpace),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // headings
//             Text(
//               'Gunakan nama asli untuk verifikasi lebih mudah. Nama ini akan muncul di beberapa halaman.',
//               style: Theme.of(context).textTheme.labelMedium,
//             ),
//             SizedBox(height: TSizes.spaceBtwSections),
//
//             // text field and button
//             Form(
//               key: controller.updateUsernameFormKey,
//               child: Column(
//                 children: [
//                   TextFormField(
//                     controller: controller.username,
//                     validator: (value) => TValidator.validateEmptyText('Nama Lengkap', value),
//                     expands: false,
//                     decoration: InputDecoration(labelText: TTexts.username, prefixIcon: Icon(Iconsax.user)),
//                   ),
//                   SizedBox(height: TSizes.spaceBtwSections),
//
//                   /// Save Button
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(onPressed: () => controller.updateUsername(), child: Text('Simpan')),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
///
class ChangeUsername extends StatelessWidget {
  const ChangeUsername({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateUsernameController());
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Ubah Username', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // headings
            Text(
              'Gunakan username yang mudah diingat. Username ini akan muncul di beberapa halaman.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: TSizes.spaceBtwSections),

            // text field and button
            Form(
              key: controller.updateUsernameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.username,
                    validator: (value) => TValidator.validateEmptyText('Username', value), // Update validator message
                    expands: false,
                    decoration:
                        InputDecoration(labelText: 'Username', prefixIcon: Icon(Iconsax.user)), // Update labelText
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),

                  /// Save Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: () => controller.updateUsername(), child: Text('Simpan')),
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
