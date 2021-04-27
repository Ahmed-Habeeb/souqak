import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souqak/controllers/authcontroller.dart';
import 'package:souqak/models/usermodel.dart';

import 'auth/registerscreen.dart';

class HomeScreen extends StatelessWidget {
  static const screenName="/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: GetBuilder<AuthController>(
            init: AuthController(),
            builder: (controller) =>
                Container(
                  width: double.infinity,
                  height: 100,
                  child: ElevatedButton(onPressed: () async{
                    Get.toNamed(RegisterScreen.screenName);

                    UserModel userModel=UserModel(name: "AhmedHabeeb",email: "habeeb2010@mail.ru",password: "01119763310");
                   // controller.createUser(userModel);

                    //controller.login("ahmedhabeeb1117@gmail.com", "01119763310");
                  }, child: Text("Cilck")),
                ),
          ),
        ),
      ),
    );
  }
}
