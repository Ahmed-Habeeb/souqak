import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:souqak/models/itemmodel.dart';
import 'package:souqak/network/store.dart';

class AddEditController extends GetxController {
  late Store store;
  late SharedPreferences sharedPreferences;
  String? token;

  TextEditingController? name;
  TextEditingController? details;
  TextEditingController? price;
  File? file0;

  var categoriesList = [
    "Clothes & Accessories",
    "Electronics",
    "Home & Garden",
    "Vehicles",
    "Family",
    "Entertainment"
  ];

  String category = "Entertainment";

  List<String> subCategoryList = [];
  String? subcategory;

  @override
  void onInit() async {
    price = TextEditingController();
    name = TextEditingController();
    details = TextEditingController();
    sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString("token");
    store = Store(token);
    handleSubcategory(category);
    super.onInit();
  }

  @override
  void dispose() {
    name!.dispose();
    details!.dispose();
    price!.dispose();
    super.dispose();
  }

  changeCategory(String cat) async {
    this.category = cat;
    handleSubcategory(cat);
    update();
  }

  changeSubcategory(String cat) async {
    this.subcategory = cat;
    update();
  }

  addItem() async {
    ItemModel item = ItemModel(
      category: category,
      details: details!.text,
      name: name!.text,
      price: double.parse(price!.text),
      subcategory: subcategory,
    );
    store.addItem(item, file0!);

    Get.back();
  }

  getGalleryimage() async {
    ImagePicker imagePicker = ImagePicker();
    var data = await (imagePicker.getImage(
      source: ImageSource.gallery,
    ) );
    file0 = File(data!.path);
    update();
  }

  getCameraimage() async {
    ImagePicker imagePicker = ImagePicker();
    PickedFile? data = await (imagePicker.getImage(
      source: ImageSource.camera,
    ));
    file0 = File(data!.path);
    update();
  }

  handleSubcategory(String category) async {
    switch (category) {
      case 'Clothes & Accessories':
        subCategoryList = [
          'Bags',
          'Women\'s Clothing & Shoes',
          'Men\'s Clothing & Shoes',
          'Jewelry & Accessories'
              'Kids',
        ];
        subcategory = 'Bags';
        break;
      case 'Electronics':
        subCategoryList = [
          'Tvs',
          'Computer',
          'Camera',
          'Phones',
          'Tablets',
        ];
        subcategory = 'Phones';

        break;
      case 'Home & Garden':
        subCategoryList = [
          'Tools',
          'Furniture',
          'Garden',
          'Appliances',
        ];
        subcategory = 'Furniture';
        break;
      case 'Vehicles':
        subCategoryList = [
          'Cars',
          'Motorcycles',
          'Toktok',
        ];
        subcategory = 'Cars';

        break;
      case 'Family':
        subCategoryList = [
          'Health & Beauty',
          'Pet Supplies',
          'Baby & Kids',
          'Toys & Games',
        ];
        subcategory = 'Health & Beauty';

        break;
      case 'Entertainment':
        subCategoryList = [
          'Video Games',
          'Books',
          'Movies & Music',
        ];
        subcategory = 'Video Games';

        break;
      default:
    }
    update();
  }
}
