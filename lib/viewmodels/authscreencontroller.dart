import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:souqak/models/usermodel.dart';
import 'package:souqak/viewmodels/authviewmodel.dart';
import 'package:souqak/viewmodels/mainscreencontroller.dart';

class AuthScreenController extends AuthViewModel {
  bool login0=true;
  bool login1=false;
  final formKey = GlobalKey<FormState>();
  final loginFormKey = GlobalKey<FormState>();

  late TextEditingController name;

  late TextEditingController email;
  late TextEditingController password;

  @override
  void onInit() async{
    name = TextEditingController();

    email = TextEditingController();
    password = TextEditingController();
    checkLogin();
    print(login1);

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
    update();
  }
  create()async{
    UserModel userModel=UserModel(name: name.text,email: email.text,password: password.text);
    var d=await super.createUser(userModel);
    if(d=="true"){
      name.text="";
      email.text="";
      password.text="";
      Navigator.of(Get.overlayContext!).pop();

      Get.find<MainScreenController>().changeIndex(0);
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

     Navigator.of(Get.overlayContext!).pop();

     Get.find<MainScreenController>().changeIndex(0);
   }else{
     Navigator.of(Get.overlayContext!).pop();

     Get.defaultDialog(
         title: "Error",
         content: Text("Email or Password is Wrong !"));
   }

  }
  logout0()async{
    bool d=await super.logout();
   if (d){
     Navigator.of(Get.overlayContext!).pop();

     Get.find<MainScreenController>().changeIndex(0);
   }else {
     Navigator.of(Get.overlayContext!).pop();

     Get.defaultDialog(
         title: "Error",
         content: Text("Email or Password is Wrong !"));
   }
  }
 checkLogin()async{
  var pref = await SharedPreferences.getInstance();
  String? token = pref.getString("token");
  login1= (token != null && token !="noToken");
  update();


}




}



