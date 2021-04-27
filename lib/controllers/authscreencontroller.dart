import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souqak/controllers/authcontroller.dart';
import 'package:souqak/models/usermodel.dart';

class AuthScreenController extends AuthController {
  final formKey = GlobalKey<FormState>();
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
  create(){
    UserModel userModel=UserModel(name: name.text,email: email.text,password: password.text);
    super.createUser(userModel);


  }
}
