import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:souqak/screens/addscreen.dart';
import 'package:souqak/screens/customdrawer.dart';
import 'package:souqak/screens/searchscreen.dart';
import 'package:souqak/viewmodels/mainscreencontroller.dart';
import 'categoriesscreen.dart';
import 'homescreen.dart';
import 'newsscreen.dart';
import 'profilescreen.dart';

class MainScreen extends StatelessWidget {
  static const screenName = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<MainScreenController>(builder: (controller)=>Stack(
        children: [
          //Inkwell Contains Drawer
          InkWell(
              onTap: () {
                controller.navOpened.value = false;
              },
              child: CustomDrawer()),
          GestureDetector(
            onTap: () {
              controller.navOpened.value = false;
            },
            onHorizontalDragUpdate: (i) {
              if (i.delta.dx > 0) {
                controller.navOpened.value = true;
              } else {
                controller.navOpened.value = false;
              }
            },
            child: AnimatedContainer(
              transform: (controller.navOpened.value)
                  ? Matrix4.translationValues(200, 70, .5)
                  : Matrix4.translationValues(0, 0, 0),
              duration: Duration(milliseconds: 400),
              width: (controller.navOpened.value)?Get.size.width:Get.size.width,
              height: (controller.navOpened.value)?Get.size.height-100:Get.size.height,
              child: MainScreen1(),
            ),
          )
        ],
      )),
    );
  }

}
class MainScreen1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
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
        backgroundColor: Colors.white,
        //elevation: 0,
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
      body: GetX<MainScreenController>(builder: (controller)=>customTabView(controller.index.value)),
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
        onPressed: () {
          Get.toNamed(AddScreen.screenName);
        },
        elevation: 5,
        child: Icon(
          FontAwesomeIcons.plus,
        ),
      ),
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
