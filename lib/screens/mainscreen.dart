import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:souqak/screens/searchscreen.dart';
import 'package:souqak/viewmodels/mainscreencontroller.dart';

import 'categoriesscreen.dart';
import 'homescreen.dart';
import 'newsscreen.dart';
import 'profilescreen.dart';

class MainScreen extends StatelessWidget {
  static final screenName = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=>Stack(
        children: [
          //Inkwell Contains Drawer
          InkWell(
              onTap: () {
                Get.find<MainScreenController>().navOpened.value = false;
              },
              child: Container(
                color: Colors.blue,
              )),
          GestureDetector(
            onTap: () {
              Get.find<MainScreenController>().navOpened.value = false;
            },
            onHorizontalDragUpdate: (i) {
              if (i.delta.dx > 0) {
                Get.find<MainScreenController>().navOpened.value = true;
              } else {
                Get.find<MainScreenController>().navOpened.value = false;
              }
            },
            child: AnimatedContainer(
              transform: (Get.find<MainScreenController>().navOpened.value)
                  ? Matrix4.translationValues(200, 50, .5)
                  : Matrix4.translationValues(0, 0, 0),
              duration: Duration(milliseconds: 400),
              child: Scaffold(
                extendBody: true,
                backgroundColor: Colors.white,
                floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
                appBar: AppBar(
                  leading: IconButton(
                    icon: Icon(FontAwesomeIcons.bars),
                    onPressed: () {
                      Get.find<MainScreenController>().navOpened.value =
                      !Get.find<MainScreenController>().navOpened.value;
                    },
                  ),
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Text(
                    "SouQak",
                    style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 1.9,
                        fontSize: 30,
                        fontFamily: "GoblinOneRegular",
                        fontWeight: FontWeight.w400),
                  ),
                  centerTitle: true,
                  actions: [
                    IconButton(
                        icon: Icon(Icons.search_sharp),
                        onPressed: () {
                          Get.toNamed(SearchScreen.screenName);
                        })
                  ],
                ),
                body: customTabView(Get.find<MainScreenController>().index.value),
                bottomNavigationBar: CurvedNavigationBar(
                  onTap: (i){
                    Get.find<MainScreenController>().index.value=i;
                  },
                  index: Get.find<MainScreenController>().index.value,
                  backgroundColor: Colors.transparent,
                  color: Colors.blue,
                  items: [
                    Icon(
                      FontAwesomeIcons.home,
                      color: Colors.white,
                      size: 20,
                    ),
                    Icon(
                      Icons.apps_sharp,
                      color: Colors.white,
                      size: 20,
                    ),
                    Icon(
                      FontAwesomeIcons.solidNewspaper,
                      color: Colors.white,
                      size: 20,
                    ),
                    Icon(
                      FontAwesomeIcons.userAlt,
                      color: Colors.white,
                      size: 20,
                    ),
                  ],
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {},
                  elevation: 5,
                  child: Icon(
                    FontAwesomeIcons.plus,
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
  customTabView(int index){
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
        return CategoriesScreen();
      case 2:
        return NewsScreen();
      case 3:
        return ProfileScreen();
      default:
        return Container(
          child: Center(
            child: Text("Default"),
          ),
        );
        break;
    }
  }
}
