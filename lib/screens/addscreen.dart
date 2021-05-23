import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:souqak/viewmodels/addeditcontroller.dart';

class AddScreen extends StatelessWidget {
  static final screenName = "add";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "ADD Screen",
          style: TextStyle(
              fontFamily: "GoblinOneRegular",
              fontWeight: FontWeight.bold,
              fontSize: 28,
              letterSpacing: 1),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: GetBuilder<AddEditController>(
            init: AddEditController(),
            builder: (controller) => Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.bottomSheet(
                          Container(
                            height: 110,
                            padding:
                                EdgeInsets.only(top: 20, left: 40, bottom: 20),
                            color: Colors.white,
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    controller.getCameraimage();
                                    Get.back();

                                  },
                                  child: Column(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.cameraRetro,
                                        color: Colors.blue,
                                        size: 35,
                                      ),
                                      SizedBox(height: 8,),

                                      Text(
                                        "Camera",
                                        style: TextStyle(
                                            fontFamily: "SansitaSwashed",
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.getGalleryimage();
                                    Get.back();
                                  },
                                  child: Column(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.solidImage,
                                        color: Colors.blue,
                                        size: 35,
                                      ),
                                      SizedBox(height: 8,),
                                      Text(
                                        "Gallery",
                                        style: TextStyle(
                                            fontFamily: "SansitaSwashed",
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: (controller.file0 == null)
                          ? Container(
                              margin: EdgeInsets.only(bottom: 50, top: 50),
                              padding: EdgeInsets.all(25),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
                              ),
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 35,
                              ),
                            )
                          : Container(
                              height: 100,
                              width: 150,
                              margin: EdgeInsets.only(bottom: 50, top: 50),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: FileImage(controller.file0!),
                                      fit: BoxFit.cover)),
                            ),
                    ),
                    TextFormField(
                        controller: controller.name,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Product Name"),
                        validator: (d) {
                          if (d!.isEmpty) {
                            return 'Please Enter Product name';
                          }

                          return null;
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        controller: controller.details,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: "Details"),
                        validator: (d) {
                          if (d!.isEmpty) {
                            return 'Please Enter Product Details';
                          }

                          return null;
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        controller: controller.price,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: "Price"),
                        validator: (d) {
                          if (d!.isEmpty) {
                            return 'Please Enter Product Price';
                          }

                          return null;
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Category : ",
                          style: TextStyle(fontSize: 17),
                        ),
                        Expanded(
                          child: DropdownButton<String>(
                              value: controller.category,
                              isExpanded: true,
                              items: controller.categoriesList
                                  .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Center(child: Text(e)),
                                      ))
                                  .toList(),
                              onChanged: (ca) {
                                controller.changeCategory(ca!);
                              }),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "SubCategory : ",
                          style: TextStyle(fontSize: 17),
                        ),
                        Expanded(
                          child: DropdownButton<String>(
                              value: controller.subcategory,
                              isExpanded: true,
                              items: controller.subCategoryList
                                  .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Center(child: Text(e)),
                                      ))
                                  .toList(),
                              onChanged: (ca) {
                                controller.changeSubcategory(ca!);
                              }),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            controller.addItem();
                          }
                        },
                        child: Text("Done"),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
