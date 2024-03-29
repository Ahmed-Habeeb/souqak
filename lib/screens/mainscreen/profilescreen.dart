import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:souqak/screens/profiledetails.dart';
import 'package:souqak/viewmodels/authscreencontroller.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetBuilder<AuthScreenController>(
        init: AuthScreenController(),
        builder: (controller) => SingleChildScrollView(
          child:
          (controller.loginCheck==null)?Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ):
          (controller.loginCheck!)
              ? profile()
              : authContainer(Get.size.height - 200, Get.width),
        ),
      ),
    );
  }
}

authContainer(double h, double w) {
  Size s = Size(w, h);
  return GetBuilder<AuthScreenController>(
    init: AuthScreenController(),
    builder: (controller) => Container(
      child: (controller.loginOrReg) ? loginForm(s) : signupForm(s),
    ),
  );
}

loginForm(Size s) {
  return Container(
    child: Padding(
      padding: EdgeInsets.only(
          top: (s.height * 0.182),
          left: s.width * 0.055,
          right: s.width * 0.055),
      child: GetBuilder<AuthScreenController>(
        builder: (controller) => Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: controller.loginFormKey,
          child: Column(
            children: [
              Text(
                "SouQak",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: "GoblinOneRegular"),
              ),
              SizedBox(
                height: s.height * 0.115,
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
                height: s.height * 0.025,
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
                height: s.height * 0.038,
              ),
              Container(
                  width: double.infinity,
                  height: Get.height * 0.064,
                  child: ElevatedButton(
                      onPressed: () {
                        if (controller.loginFormKey.currentState!.validate()) {
                          Get.defaultDialog(
                              barrierDismissible: false,
                              title: "Loading",
                              content: CircularProgressIndicator());
                          controller.login(null , null);
                        }
                      },
                      child: Text("Login"))),
              SizedBox(
                height: s.height * 0.150,
              ),
              InkWell(
                  onTap: () {
                    // Get.offNamed(RegisterScreen.screenName);
                    controller.changeLogin(false);
                  },
                  child: Text(
                    "Have not an Account, Register!",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
      ),
    ),
  );
}

signupForm(Size s) {
  return Container(
    child: Padding(
      padding: EdgeInsets.only(
          top: (s.height * 0.182),
          left: s.width * 0.055,
          right: s.width * 0.055),
      child: GetBuilder<AuthScreenController>(
        builder: (controller) => Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: controller.formKey,
          child: Column(
            children: [
              Text(
                "SouQak",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 40,
                  fontFamily: "GoblinOneRegular",
                ),
              ),
              SizedBox(
                height: s.height * 0.115,
              ),
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
                height: s.height * 0.0256,
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
                height: s.height * 0.0256,
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
                height: s.height * 0.038,
              ),
              Container(
                  width: double.infinity,
                  height: Get.height * 0.064,
                  child: ElevatedButton(
                      onPressed: () {
                        if (controller.formKey.currentState!.validate()) {
                          Get.defaultDialog(
                              barrierDismissible: false,
                              title: "Loading",
                              content: CircularProgressIndicator());
                          controller.create(null);
                        }
                      },
                      child: Text("SignUp"))),
              SizedBox(
                height: s.height * 0.07,
              ),
              InkWell(
                  onTap: () {
                    // Get.offNamed(LoginScreen.screenName);
                    controller.changeLogin(true);
                  },
                  child: Text(
                    "Already Have an Account!",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
      ),
    ),
  );
}

profile() {
  return Container(
    height: Get.height - 250,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ListTile(
          leading: Icon(
            FontAwesomeIcons.userAlt,
          ),
          title: Text(
            "Profile Details",
            style: TextStyle(
                fontSize: 25,
                fontFamily: "SansitaSwashed",
                fontWeight: FontWeight.bold),
          ),
          trailing: Icon(FontAwesomeIcons.chevronRight),
          onTap: () {
            Get.to(() => ProfileDetails());
          },
        ),
        ListTile(
          leading: Icon(
            FontAwesomeIcons.truck,
          ),
          title: Text(
            "My Orders",
            style: TextStyle(
                fontSize: 25,
                fontFamily: "SansitaSwashed",
                fontWeight: FontWeight.bold),
          ),
          trailing: Icon(FontAwesomeIcons.chevronRight),
          onTap: () {
            Get.to(() => ProfileDetails());
          },
        ),
        ListTile(
          leading: Icon(
            FontAwesomeIcons.wallet,
          ),
          title: Text(
            "Wallet",
            style: TextStyle(
                fontSize: 25,
                fontFamily: "SansitaSwashed",
                fontWeight: FontWeight.bold),
          ),
          trailing: Icon(FontAwesomeIcons.chevronRight),
          onTap: () {
            Get.to(() => ProfileDetails());
          },
        ),
        ListTile(
          leading: Icon(
            FontAwesomeIcons.gift,
          ),
          title: Text(
            "My Coupon",
            style: TextStyle(
                fontSize: 25,
                fontFamily: "SansitaSwashed",
                fontWeight: FontWeight.bold),
          ),
          trailing: Icon(FontAwesomeIcons.chevronRight),
          onTap: () {
            Get.to(() => ProfileDetails());
          },
        ),
        ListTile(
          leading: Icon(
            FontAwesomeIcons.solidCommentDots,
          ),
          title: Text(
            "Chat With Us",
            style: TextStyle(
                fontSize: 25,
                fontFamily: "SansitaSwashed",
                fontWeight: FontWeight.bold),
          ),
          trailing: Icon(FontAwesomeIcons.chevronRight),
          onTap: () {
            Get.to(() => ProfileDetails());
          },
        ),
        GetBuilder<AuthScreenController>(
          init: AuthScreenController(),
          builder: (controller) => ListTile(
            leading: Icon(
              FontAwesomeIcons.signOutAlt,
              color: Colors.red,
            ),
            title: Text(
              "log Out",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.red,
                  fontFamily: "SansitaSwashed",
                  fontWeight: FontWeight.w600),
            ),
            trailing: Icon(
              FontAwesomeIcons.chevronRight,
              color: Colors.red,
            ),
            onTap: () {
              Get.defaultDialog(
                  barrierDismissible: false,
                  title: "Loading",
                  content: CircularProgressIndicator());
              controller.logout();
            },
          ),
        )
      ],
    ),
  );
}

profile1() {
  return GetBuilder<AuthScreenController>(
    init: AuthScreenController(),
    builder: (controller) => Container(
      margin: EdgeInsets.only(top: 400),
      child: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.red, minimumSize: Size(double.infinity, 50)),
          onPressed: () {
            Get.defaultDialog(
                barrierDismissible: false,
                title: "Loading",
                content: CircularProgressIndicator());
            controller.logout();
          },
          child: Text("Logout"),
        ),
      ),
    ),
  );
}
