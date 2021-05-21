import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souqak/screens/categorydetailsscreen.dart';
import 'package:souqak/viewmodels/mainscreencontroller.dart';

class HomeScreen extends StatelessWidget {
  final faker = Faker();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainScreenController>(
      builder: (controller) => Container(

        child: ListView.builder(
          padding: EdgeInsets.only(top: 40),
          itemCount: controller.categoriesList.length,
          itemBuilder: (context, index) =>
              drawCategory(controller.categoriesList[index]),
        ),
      ),
    );
  }

  drawCategory(String category) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                category,
                style:
                    TextStyle(fontSize: 13.5, fontFamily: "GoblinOneRegular"),
              ),
              InkWell(
                onTap: () {
                  Get.find<MainScreenController>().selectedCategory = category;
                  Get.toNamed(CategoryDetailsScreen.screenName);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "See all",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
          Container(
            height: 230,
            margin: EdgeInsets.only(top: 20,bottom: 20,),
            child: ListView.builder(
              itemCount: 10,

              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => drawCard(faker.image.image(
                  height: 100,
                  width: 100,
                  random: true,
                  keywords: [category]),category),
            ),
          )
        ],
      ),
    );
  }


  drawCard(String image,String category) {
    return InkWell(
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //image
              Container(
                margin: EdgeInsets.only(bottom: Get.height * .010),
                height: Get.height * .18,
                width: (Get.width * .6),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(image),
                        fit: BoxFit.contain)),
              ),
              Flexible(
                child: Container(
                 // width: (Get.width * .6),
                  padding: EdgeInsets.only(left: 10,right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            faker.person.name(),
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            category,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),

                        ],
                      ),

                      Text(
                        "250" + " \$",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "SansitaSwashed",
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
