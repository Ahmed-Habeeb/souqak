import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:souqak/controllers/categories_controller.dart';
import 'package:souqak/screens/search_screen.dart';
import 'package:souqak/screens/shared/drawer/not_userdrawer.dart';
import 'package:souqak/screens/subcategories_screen.dart';

class Home_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Not_UserDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'SouQak',
          style: TextStyle(
              color: Colors.blue,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.5),
        ),
        actions: [
          IconButton(
            icon: Icon(FontAwesomeIcons.search),
            onPressed: () {
              Get.to(Search_Screen());
            },
          )
        ],
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: GetBuilder<Categories_Controller>(
        init: Categories_Controller(),
        builder: (data) => Column(
          children: [
            Container(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data.categories.length,
                itemBuilder: (context, index) {
                  if (data.categories[index] == data.selected_category) {
                    return draw_selected_category(data.categories[index]);
                  } else
                    return InkWell(
                      child: draw_category(data.categories[index]),
                      onTap: () {
                        data.change_selected_category(data.categories[index]);
                      },
                    );
                },
              ),
            ),
            SubCategories_Screen()
          ],
        ),
      ),
    );
  }

  draw_selected_category(String name) {
    return Container(
        margin: EdgeInsets.only(bottom: 10, top: 10, left: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.blue,
            border: Border.all(color: Colors.blue, width: 2.5),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Text(
          name,
          style: TextStyle(color: Colors.white),
        ));
  }

  draw_category(String name) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, top: 10, left: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 2.5),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Text(
        name,
        style: TextStyle(color: Colors.blue),
      ),
    );
  }
}
