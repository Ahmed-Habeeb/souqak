import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souqak/controllers/authcontroller.dart';
import 'package:souqak/models/usermodel.dart';
import 'package:souqak/screens/homescreen.dart';

class AuthScreenController extends AuthController {
  final formKey = GlobalKey<FormState>();
  final loginFormKey = GlobalKey<FormState>();

  late TextEditingController name;

  late TextEditingController email;
  late TextEditingController password;

  @override
  void onInit() {
    name = TextEditingController();

    email = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }
  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }
  create()async{
    UserModel userModel=UserModel(name: name.text,email: email.text,password: password.text);
    var d=await super.createUser(userModel);
    if(d=="true"){
      name.text="";
      email.text="";
      password.text="";

      Get.offAllNamed(HomeScreen.screenName);
    }else{
      Navigator.of(Get.overlayContext!).pop();

      Get.defaultDialog(
          title: "Error",
          content: Text(d));
    }


  }
  login()async{
   var d=await super.loginUser(email.text, password.text);
   if(d=="true"){
     name.text="";
     email.text="";
     password.text="";

     Get.offAllNamed(HomeScreen.screenName);
   }else{
     Navigator.of(Get.overlayContext!).pop();

     Get.defaultDialog(
         title: "Error",
         content: Text("Email or Password is Wrong !"));
   }

  }
}
