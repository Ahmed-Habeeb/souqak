import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:souqak/screens/auth/login_screen.dart';
import 'package:souqak/screens/auth/signup_screen.dart';
import 'package:souqak/screens/home_screen.dart';

class Not_UserDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        UserAccountsDrawerHeader(
          accountEmail: Text(""),
          accountName: Text(""),
          decoration: BoxDecoration(color: Colors.deepPurple),
        ),
        ListTile(
          leading: Icon(
            FontAwesomeIcons.home,
            color: Colors.black,
          ),
          title: Text("Home"),
          onTap: () {
            Get.offAll(Home_Screen());
          },
        ),
        ListTile(
          leading: Icon(
            FontAwesomeIcons.signInAlt,
          ),
          title: Text("Login"),
          onTap: () {
            Get.to(Login_Screen());
          },
        ),
        ListTile(
          leading: Icon(
            FontAwesomeIcons.userPlus,
          ),
          title: Text("Register"),
          onTap: () {
            Get.to(SignUp_Screen());
          },
        ),
      ],
    ));
  }
}
