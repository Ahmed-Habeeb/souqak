
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:souqak/screens/searchscreen.dart';

class MainScreen extends StatefulWidget {
  static final screenName = "/";

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool navOpened = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          InkWell(
            onTap: (){
              setState(() {
                navOpened=false;
              });
            },
              child: Container(
            color: Colors.blue,
          )),
          GestureDetector(
            onTap: (){setState(() {
              navOpened=false;
            });},
            onHorizontalDragUpdate: (i){
              if(i.delta.dx>0){
                setState(() {
                  navOpened=true;

                });
              }else{
                setState(() {
                  navOpened=false;

                });
              }
            },
            child: AnimatedContainer(
              transform: (navOpened)
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
                      setState(() {
                        navOpened = !navOpened;
                      });
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
                body: SingleChildScrollView(
                  child: Column(
                    children: [],
                  ),
                ),
                bottomNavigationBar: CurvedNavigationBar(
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
      ),
    );
  }
}
