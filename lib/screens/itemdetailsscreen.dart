import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souqak/viewmodels/mainscreencontroller.dart';

class ItemDetailsScreen extends StatelessWidget {
  static const screenName = "itemDetails";

  int? index;
  String url = "http://192.168.1.18:8000/storage/images/";

  ItemDetailsScreen(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: GetBuilder<MainScreenController>(
        builder: (controller) => SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: index!,
                  child: Container(
                    height: 220,
                    width: double.infinity,
                    child: Image.network(
                      url + controller.latest[index!].image!,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: controller.latest[index!].name!,
                        child: Text(
                          controller.latest[index!].name!,
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontFamily: "SansitaSwashed"),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        controller.latest[index!].price!.toString() + "  \$",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Colors.blue,
                            fontFamily: "GoblinOneRegular"),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        controller.latest[index!].details!,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.grey.shade700,
                          //    fontFamily: "SansitaSwashed"
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
