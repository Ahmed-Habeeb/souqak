import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souqak/models/usermodel.dart';
import 'package:souqak/screens/mainscreen/mainscreen.dart';
import 'package:souqak/viewmodels/authviewmodel.dart';

class AuthScreenController extends AuthViewModel {
  bool login0=true;
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
  changeLogin(bool b){
    login0=b;
    print(Get.size);
    update();
  }
  create()async{
    UserModel userModel=UserModel(name: name.text,email: email.text,password: password.text);
    var d=await super.createUser(userModel);
    if(d=="true"){
      name.text="";
      email.text="";
      password.text="";

      Get.offAllNamed(MainScreen.screenName);
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

     Get.offAllNamed(MainScreen.screenName);
   }else{
     Navigator.of(Get.overlayContext!).pop();

     Get.defaultDialog(
         title: "Error",
         content: Text("Email or Password is Wrong !"));
   }

  }
}
