import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souqak/controllers/categories_controller.dart';

class SubCategories_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: GetBuilder<Categories_Controller>(
      builder: (data) => Column(
        children: [
          Container(
            height: 60,
            child:(data.subcategory!=null)? ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data.subcategory.length,
              itemBuilder: (context, index) {
                if (data.subcategory[index] == data.selected_subcategory) {
                  return draw_selected_category(data.subcategory[index]);
                } else
                  return InkWell(
                    child: draw_category(data.subcategory[index]),
                    onTap: () {
                      data.change_selected_subcategory(data.subcategory[index]);
                    },
                  );
              },
            ):Container(),
          ),
        ],
      ),
    ));
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
