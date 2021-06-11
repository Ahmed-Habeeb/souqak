import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:souqak/mybindings.dart';
import 'package:souqak/screens/addscreen.dart';
import 'package:souqak/viewmodels/authviewmodel.dart';
import 'screens/categorydetailsscreen.dart';
import 'screens/mainscreen/mainscreen.dart';
import 'screens/searchscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onInit: () async {
        var pref = await SharedPreferences.getInstance();
        String? token = pref.getString("token");

        getUser(token);
      },
      title: "SouQak",
      initialBinding: MyBindings(),
      routes: {
        MainScreen.screenName: (context) => MainScreen(),
        SearchScreen.screenName: (context) => SearchScreen(),
        AddScreen.screenName: (context) => AddScreen(),
        CategoryDetailsScreen.screenName: (context) => CategoryDetailsScreen(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: MainScreen.screenName,
    );
  }

  getUser(String? token) async {
    if (token != null && token != "noToken") {
      print(token);
      Get.find<AuthViewModel>().me(token);
    }
  }
}
