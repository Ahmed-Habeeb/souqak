import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:souqak/models/itemmodel.dart';
import 'package:souqak/screens/categorydetailsscreen.dart';
import 'package:souqak/screens/itemdetailsscreen.dart';
import 'package:souqak/screens/searchscreen.dart';
import 'package:souqak/viewmodels/mainscreencontroller.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainScreenController>(
      builder: (controller) => Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            top: 25,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed(SearchScreen.screenName);
                },
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(color: Colors.grey.shade100),
                  child: Row(
                    children: [
                      Icon(FontAwesomeIcons.search),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Search ...",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            fontFamily: "SansitaSwashed",
                            letterSpacing: 1.2),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 20),
                child: Text(
                  "Categories",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 20, right: 20),
                itemCount: controller.categoriesList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.7,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemBuilder: (context, index) =>
                    categoryCard(controller.categoriesList[index]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 10, bottom: 20),
                child: Text(
                  "Latest Products",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              GridView.builder(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 100),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .75,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemCount: controller.latest.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) =>
                    drawLatestCard(controller.latest[index], index),
              ),
            ],
          ),
        ),
      ),
    );
  }

  categoryCard(String category) {
    return InkWell(
      onTap: () {
        Get.find<MainScreenController>().selectedCategory = category;
        Get.toNamed(CategoryDetailsScreen.screenName);
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
          (category == "Clothes & Accessories") ? "Clothes" : category,
          style: TextStyle(
              color: Colors.white,
              fontFamily: "SansitaSwashed",
              fontSize: 14.3),
        )),
      ),
    );
  }

  drawLatestCard(ItemModel item, int index) {
    String url = "http://192.168.1.18:8000/storage/images/";

    return InkWell(
      onTap: () {
        Get.to(() => ItemDetailsScreen(index));
      },
      child: Card(
        elevation: 8,
        child: Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: index,
                child: Container(
                  height: 95,
                  width: Get.width / 2 - 20,
                  child: Image.network(
                    url + item.image!,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: item.name!,
                      child: Container(
                        constraints:
                            BoxConstraints(maxWidth: Get.width / 2 - 20),
                        child: Text(
                          "${item.name}  \n${item.price} \$",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(item.category!),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
