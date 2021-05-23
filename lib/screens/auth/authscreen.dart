import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souqak/viewmodels/authscreencontroller.dart';


class AuthScreen extends StatelessWidget {
  static const screenName="authscreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: authContainer(Get.height,Get.width),
    );
  }
}
authContainer(double h,double w){
  Size s=Size(w, h);
  return GetBuilder<AuthScreenController>(
    init: AuthScreenController(),
    builder: (controller) => Container(
    child: (controller.login0)?loginForm(s):signupForm(s),

  ),);
}
loginForm(Size s){
  return Container(



    child: Padding(
      padding:  EdgeInsets.only(top: (s.height*0.182), left: s.width*0.055, right: s.width*0.055),
      child: GetBuilder<AuthScreenController>(
        builder: (controller) => Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: controller.loginFormKey,
          child: Column(
            children: [
              Text("SouQak",style: TextStyle(color: Colors.blue,fontSize: 40,fontWeight: FontWeight.bold,fontFamily: "GoblinOneRegular"),),
              SizedBox(height: s.height*0.115,),

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
                height: s.height*0.025,
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
                height: s.height*0.038,
              ),
              Container(
                width: double.infinity,
                  height: Get.height*0.064,
                  child: ElevatedButton(onPressed: (){
                    if(controller.loginFormKey.currentState!.validate()) {
                      Get.defaultDialog(
                          barrierDismissible: false,
                          title: "Loading",
                          content: CircularProgressIndicator());
                      controller.login();
                    }
                  }, child: Text("Login"))),
              SizedBox(height: s.height*0.150,),
              InkWell(
                  onTap: (){
                   // Get.offNamed(RegisterScreen.screenName);
                    controller.changeLogin(false);

                  },
                  child: Text("Have not an Account, Register!",style: TextStyle(fontWeight: FontWeight.bold),))


            ],
          ),
        ),
      ),
    ),
  );
}
signupForm(Size s){

  return Container(


    child: Padding(
      padding:  EdgeInsets.only(top: (s.height*0.182), left: s.width*0.055, right: s.width*0.055),
      child: GetBuilder<AuthScreenController>(

        builder: (controller) => Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: controller.formKey,
          child: Column(
            children: [
              Text("SouQak",style: TextStyle(color: Colors.blue,fontSize: 40,fontFamily: "GoblinOneRegular",),),
              SizedBox(height: s.height*0.115,),
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
                height: s.height*0.0256,
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
                height: s.height*0.0256,
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
                height: s.height*0.038,
              ),
              Container(
                width: double.infinity,
                  height: Get.height*0.064,
                  child: ElevatedButton(onPressed: (){
                    if(controller.formKey.currentState!.validate()) {
                      Get.defaultDialog(
                          barrierDismissible: false,
                          title: "Loading",
                          content: CircularProgressIndicator());
                      controller.create();
                    }
                  }, child: Text("SignUp"))),
              SizedBox(height: s.height*0.07,),
              InkWell(
                  onTap: (){
                   // Get.offNamed(LoginScreen.screenName);
                    controller.changeLogin(true);

                  },
                  child: Text("Already Have an Account!",style: TextStyle(fontWeight: FontWeight.bold),))


            ],
          ),
        ),
      ),
    ),
  );
}
