import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souqak/screens/auth/registerscreen.dart';

import 'screens/homescreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      routes: {
        HomeScreen.screenName: (context) => HomeScreen(),

        // LoginScreen.screenName: (context) => LoginScreen(),
         RegisterScreen.screenName: (context) => RegisterScreen(),
        // SearchScreen.screenName: (context) => SignUpScreen(),
        // SubCategoriesScreen.screenName: (context) => SubCategoriesScreen(),





      },
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.screenName,
    );
  }
}
