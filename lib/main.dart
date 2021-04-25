import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      routes: {
        // LoginScreen.screenName: (context) => LoginScreen(),
        // SignUpScreen.screenName: (context) => SignUpScreen(),
        // HomeScreen.screenName: (context) => HomeScreen(),
        // SearchScreen.screenName: (context) => SignUpScreen(),
        // SubCategoriesScreen.screenName: (context) => SubCategoriesScreen(),





      },
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
    );
  }
}
