import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souqak/mybindings.dart';
import 'package:souqak/screens/addscreen.dart';
import 'package:souqak/screens/auth/registerscreen.dart';
import 'screens/auth/loginscreen.dart';
import 'screens/categorydetailsscreen.dart';
import 'screens/mainscreen.dart';
import 'screens/searchscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "SouQak",
      initialBinding: MyBindings(),
      routes: {
        MainScreen.screenName: (context) => MainScreen(),

        LoginScreen.screenName: (context) => LoginScreen(),
        RegisterScreen.screenName: (context) => RegisterScreen(),
        SearchScreen.screenName: (context) => SearchScreen(),
        AddScreen.screenName: (context) => AddScreen(),
        CategoryDetailsScreen.screenName: (context) => CategoryDetailsScreen(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: MainScreen.screenName,
    );
  }
}
