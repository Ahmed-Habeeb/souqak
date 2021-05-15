import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souqak/screens/auth/loginscreen.dart';
import 'package:souqak/viewmodels/authscreenviewmodel.dart';

class RegisterScreen extends StatelessWidget {
  static const screenName = "Register";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(

        width: double.infinity,
        height: double.infinity,

        child: Padding(
          padding: const EdgeInsets.only(top: 150, left: 20, right: 20),
          child: GetBuilder<AuthScreenViewModel>(

            builder: (controller) => Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: controller.formKey,
              child: Column(
                children: [
                  Text("SouQak",style: TextStyle(color: Colors.blue,fontSize: 50,fontWeight: FontWeight.bold,letterSpacing: 1.2),),
                  SizedBox(height: 90,),
                  TextFormField(
                    controller: controller.name,
                    style: TextStyle(color: Colors.black),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: "name",
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                    ),
                    validator: (d) {
                      if (d!.isEmpty) {
                        return 'Please Enter your name!';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: controller.email,
                    style: TextStyle(color: Colors.black),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: "E-mail",
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                    ),
                    validator: (d) {
                      if (d!.isEmpty) {
                        return 'Please Enter an E-mail!';
                      } else if (!d.contains("@")) {
                        return 'E-mail must have @ sign !';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: controller.password,
                    style: TextStyle(color: Colors.black),
                    cursorColor: Colors.black,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: "Password",
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    validator: (d) {
                      if (d!.isEmpty) {
                        return 'Please Enter Password!';
                      } else if (d.length < 8) {
                        return 'Password must be more than 8  !';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                      height: 50,
                      child: ElevatedButton(onPressed: (){
                        if(controller.formKey.currentState!.validate()) {
                          Get.defaultDialog(
                              barrierDismissible: false,
                              title: "Loading",
                              content: CircularProgressIndicator());
                          controller.create();
                        }
                      }, child: Text("SignUp"))),
                  SizedBox(height: 100,),
                  InkWell(
                    onTap: (){
                      Get.offNamed(LoginScreen.screenName);

                    },
                      child: Text("Already Have an Account!",style: TextStyle(fontWeight: FontWeight.bold),))


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}