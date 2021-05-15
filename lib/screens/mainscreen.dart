import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:souqak/screens/searchscreen.dart';

class MainScreen extends StatelessWidget {
  static const screenName = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
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
      drawer: Drawer(
        child: Container(
          color: Colors.blue,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  //child:Text("h")
                ),
              ),
            )
          ],
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
    );
  }
}
