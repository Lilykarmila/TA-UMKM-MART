import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ta_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ta_ecommerce/utils/constans/sizes.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text('Tambah Alamat Baru')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: 'Nama')),
                SizedBox(height: TSizes.spaceBtwInputFields),
                TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.mobile), labelText: 'No Hp')),
                SizedBox(height: TSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                          decoration: InputDecoration(prefixIcon: Icon(Iconsax.building_31), labelText: 'Jalan')),
                    ),
                    SizedBox(width: TSizes.spaceBtwInputFields),
                    Expanded(
                        child: TextFormField(
                            decoration: InputDecoration(prefixIcon: Icon(Iconsax.code), labelText: 'Kode Pos'))),
                  ],
                ),
                SizedBox(height: TSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                          decoration: InputDecoration(prefixIcon: Icon(Iconsax.building), labelText: 'Kota')),
                    ),
                    SizedBox(width: TSizes.spaceBtwInputFields),
                    Expanded(
                        child: TextFormField(
                            decoration: InputDecoration(prefixIcon: Icon(Iconsax.activity), labelText: 'Provinsi'))),
                  ],
                ),
                SizedBox(height: TSizes.spaceBtwInputFields),
                TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.global), labelText: 'Negara')),
                SizedBox(height: TSizes.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () {}, child: Text('Simpan')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
