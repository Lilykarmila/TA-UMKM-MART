import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ta_ecommerce/controller/product_controller/product_controller.dart';
import 'package:ta_ecommerce/model/category_model.dart';

import '../../../../controller/product_controller/all_products_controller.dart';
import '../../../../model/merchant_model.dart';
import '../../../../model/product_model.dart';

class ProductInputPage extends StatefulWidget {
  @override
  _ProductInputPageState createState() => _ProductInputPageState();
}

class _ProductInputPageState extends State<ProductInputPage> {
  List<CategoryModel> categoryList = [];
  final controller = Get.put(ProductController());
  String? selectedCategory;
  late SharedPreferences _prefs;
  late String _merchantId = "";
  late String _merchantName = "";
  late String _merchantImage = "";
  late String _merchantEmail = "";

  @override
  void initState() {
    super.initState();
    _initPreferences();
    fetchCategory();
  }

  _initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    _merchantId = _prefs.getString('uid') ?? '';
    _merchantName = _prefs.getString('name') ?? '';
    _merchantImage = _prefs.getString('image') ?? '';
    setState(() {});
  }

  fetchCategory() async {
    QuerySnapshot categorySnapshot = await FirebaseFirestore.instance.collection('Categories').get();

    List<CategoryModel> fetchedCategory = categorySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return CategoryModel(
          id: doc.id,
          name: data['Name'],
          isFeatured: data["IsFeatured"],
          parentId: data["ParentId"].toString(),
          image: data["Image"]);
    }).toList();
    setState(() {
      categoryList = fetchedCategory;
    });
  }

  void openAddProductDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddProductDialog(
          onSubmit: (String productName, String productPrice, String productDesc, String? imgUrl) {
            _submitProduct(productName, productPrice, productDesc, imgUrl);
            Navigator.pop(context); // Close the dialog
          },
          onCategoryChanged: (category) {
            setState(() {
              selectedCategory = category;
            });
          },
          categoryList: categoryList,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produk Toko'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              openAddProductDialog();
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Product').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (snapshot.data!.docs.isEmpty) {
            return Text('No products found.');
          }
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data() as Map<String, dynamic>;
              print("id ${_merchantName}");
              return data["Merchant"]["Id"] == _merchantId
                  ? ListTile(
                      title: Text(data['Title']),
                      subtitle: Text('Price: \$${data['Price']}'),
                      leading: Image.network(data['Thumbnail']),
                      // You can customize ListTile further as per your requirement
                    )
                  : Container();
            }).toList(),
          );
        },
      ),
    );
  }

  void _submitProduct(String productName, String productPrice, String productDesc, String? imgUrl) {
    final ProductModel product = ProductModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(), // Generate a unique ID
        title: productName,
        price: productPrice,
        productType: "",
        categoryId: selectedCategory,
        thumbnail: imgUrl.toString(),
        description: productDesc,
        images: [],
        isFeatured: true,
        merchant: MerchantModel(
          id: _merchantId,
          image: _merchantImage,
          email: _merchantEmail,
          name: _merchantName,
          isFeatured: true,
          description: "",
          type: "",
        ));
    controller.submitProduct(context, product);
  }
}

class AddProductDialog extends StatefulWidget {
  final Function(String, String, String, String?) onSubmit;
  final Function(String?) onCategoryChanged;
  final List<CategoryModel> categoryList;

  AddProductDialog({required this.onSubmit, required this.onCategoryChanged, required this.categoryList});
  @override
  _AddProductDialogState createState() => _AddProductDialogState();
}

class _AddProductDialogState extends State<AddProductDialog> {
  CategoryModel? selectedCategory;
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  File? _imageFile; // To hold the selected image file

  // Function to pick image from gallery
  Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
    }
  }

  ///------------------------- upload image to firebase
  Future<String?> _uploadImageToStorage() async {
    Reference storageReference = FirebaseStorage.instance.ref().child('Products/${DateTime.now()}.png');
    UploadTask uploadTask = storageReference.putFile(_imageFile!);
    await uploadTask;

    print("Image uploaded");

    // Get the download URL after the upload is complete
    String downloadURL = await storageReference.getDownloadURL();

    print("Image URL: $downloadURL");

    return downloadURL; // Placeholder URL, replace this with the actual URL
  }

  ///------------------ Alert dialog
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text('Add Product'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Product Name'),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<CategoryModel>(
              value: selectedCategory,
              onChanged: (value) {
                widget.onCategoryChanged(value?.id);
                setState(() {
                  selectedCategory = value!;
                });
              },
              items: widget.categoryList.map((product) {
                return DropdownMenuItem<CategoryModel>(
                  value: product,
                  child: Text(product.name),
                );
              }).toList(),
              decoration: InputDecoration(labelText: 'Category'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Price'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: descriptionController,
              minLines: 3,
              maxLines: 6,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 10),

            ///--------------- Pick Image
            ElevatedButton(
              onPressed: () {
                _pickImage(ImageSource.gallery);
              },
              child: Text('Pick Image'),
            ),
            if (_imageFile != null) Image.file(_imageFile!),
            SizedBox(height: 10),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),

        ///--------------------------- Tombol Submit / kirim data ke difirebase
        TextButton(
          child: Text('Submit'),
          onPressed: () async {
            String? imageUrl = await _uploadImageToStorage();
            print("imageurl ${imageUrl}");
            widget.onSubmit(nameController.text, priceController.text, descriptionController.text, imageUrl);
            nameController.clear();
            priceController.clear();
            descriptionController.clear();
            selectedCategory = null;
            setState(() {
              _imageFile = null; // Reset image file after submission
            });
          },
        ),
      ],
    );
  }
}
