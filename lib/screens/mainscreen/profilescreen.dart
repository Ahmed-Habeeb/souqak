import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souqak/screens/auth/authscreen.dart';





class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: authContainer(Get.size.height-200,Get.width),
      ),

    );
  }
}
