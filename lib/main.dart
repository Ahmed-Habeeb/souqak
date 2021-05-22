import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souqak/mybindings.dart';
import 'package:souqak/screens/addscreen.dart';
import 'package:souqak/screens/auth/authscreen.dart';

import 'screens/categorydetailsscreen.dart';
import 'screens/mainscreen/mainscreen.dart';
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
        AuthScreen.screenName: (context) => AuthScreen(),
        SearchScreen.screenName: (context) => SearchScreen(),
        AddScreen.screenName: (context) => AddScreen(),
        CategoryDetailsScreen.screenName: (context) => CategoryDetailsScreen(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: MainScreen.screenName,
    );
  }
}
