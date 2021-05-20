import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souqak/viewmodels/mainscreencontroller.dart';


class CategoryDetailsScreen extends StatelessWidget {

  static const screenName="categorydetails";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Get.find<MainScreenController>().selectedCategory),),
    );
  }
}
