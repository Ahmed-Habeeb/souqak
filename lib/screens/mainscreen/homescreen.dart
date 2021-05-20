import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souqak/screens/categorydetailsscreen.dart';
import 'package:souqak/viewmodels/mainscreencontroller.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainScreenController>(builder: (controller) => Container(
      child: ListView.builder(
        padding: EdgeInsets.only(top: 40),
        itemCount: 1,
        itemBuilder: (context, index) => drawCategory(controller.categoriesList[index]),

      ),
    ),);
  }
  drawCategory(String category){
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: Column(

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text(category,style: TextStyle(fontSize: 13.5,fontFamily: "GoblinOneRegular"),),
            InkWell(
              onTap: (){
                Get.find<MainScreenController>().selectedCategory=category;
                Get.toNamed(CategoryDetailsScreen.screenName);

              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(20)),
                child: Text("See all",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              ),
            )
          ],)
        ],
      ),
    );
  }
}
