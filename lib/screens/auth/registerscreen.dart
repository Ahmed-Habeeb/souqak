import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souqak/controllers/authscreencontroller.dart';

class RegisterScreen extends StatelessWidget {
  static const screenName = "Register";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment(-1.0, -4.0),
                end: Alignment(1.0, 4.0),
                colors: [
              Colors.white,
              Colors.blue,
            ])),
        child: Padding(
          padding: const EdgeInsets.only(top: 150, left: 20, right: 20),
          child: GetBuilder<AuthScreenController>(
            init: AuthScreenController(),
            builder: (controller) => Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: controller.formKey,
              child: Column(
                children: [
                  Text("SouQak",style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold,letterSpacing: 1.2),),
                  SizedBox(height: 90,),
                  TextFormField(
                    controller: controller.name,
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),
                      labelText: "name",
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
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
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),
                      labelText: "E-mail",
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
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
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),
                      labelText: "Password",
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
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
                        if(controller.formKey.currentState!.validate())
                        controller.create();
                      }, child: Text("SignUp")))


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
