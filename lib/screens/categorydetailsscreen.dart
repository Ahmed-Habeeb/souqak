import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:souqak/models/itemmodel.dart';
import 'package:souqak/viewmodels/mainscreencontroller.dart';

import 'itemdetailsscreen.dart';

class CategoryDetailsScreen extends StatelessWidget {
  static const screenName = "categorydetails";
  ScrollController _controller=ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,

      appBar: AppBar(
        title: Text(Get.find<MainScreenController>().selectedCategory),
      ),
      body: Container(
        child: GetBuilder<MainScreenController>(
          builder: (controller) => Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: double.infinity,
                    child: Center(
                      child: ListView.builder(

                        padding:
                        EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.subCategoryList.length,
                        itemBuilder: (context, index) {
                          return (controller.subCategoryList[index] ==
                              controller.subcategory)
                              ? drawSelectedSubCategory(controller.subcategory!)
                              : drawSubCategory(controller.subCategoryList[index]);
                        },
                      ),
                    ),
                  ),
                  StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                    staggeredTileBuilder: (int index) =>
                    new StaggeredTile.count(2, index.isEven ? 2.7: 2.4),
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,

                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    itemCount: controller.latest.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) =>
                        drawItemCard(controller.latest[index], index)

                  )
                ],
              ),

            ),
          )
        ),
      ),
    );
  }

  drawSelectedSubCategory(String subCategory) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Center(
        child: Text(
          subCategory,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  drawSubCategory(String subCategory) {
    return InkWell(
      onTap: (){
        Get.find<MainScreenController>().changeSubcategory(subCategory);

      },
      child: Container(
        margin: EdgeInsets.only(left: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Center(child: Text(subCategory,
          style: TextStyle(color: Colors.blue,
            fontFamily: "SansitaSwashed",
            fontWeight: FontWeight.bold
          ),

        ),
        ),
      ),
    );
  }
  drawItemCard(ItemModel item, int index,) {
    String url = "http://192.168.1.10:8000/storage/images/";

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
                    Container(
                      constraints:
                      BoxConstraints(maxWidth: Get.width / 2 - 20),
                      child: Text(
                        "${item.name}  \n${item.price} \$",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
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
