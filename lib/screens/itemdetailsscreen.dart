import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:souqak/viewmodels/mainscreencontroller.dart';

class ItemDetailsScreen extends StatefulWidget {
  int? _index;

  ItemDetailsScreen(this._index);

  @override
  _ItemDetailsScreenState createState() => _ItemDetailsScreenState(_index);
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  int? _index;
  String _url = "http://192.168.1.10:8000/storage/images/";
  int _quantity = 1;

  _ItemDetailsScreenState(this._index);

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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: _index!,
                    child: Container(
                      height: Get.height / 2 - 20,
                      width: double.infinity,
                      child: Image.network(
                        _url + controller.latest[_index!].image!,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.latest[_index!].name!,
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontFamily: "SansitaSwashed"),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          controller.latest[_index!].details!,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Colors.grey.shade700,
                            //    fontFamily: "SansitaSwashed"
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            counterDrawer(),
                            Row(
                              children: [
                                Text(
                                  "Total  : ",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                                Text(
                                  "\$ ${controller.latest[_index!].price! * _quantity}",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: "SansitaSwashed",
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Add to Cart"),
                          style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(
                                  Size(double.infinity, 50))),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  counterDrawer() {
    return Row(
      children: [
        Text(
          "Qty",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.grey.shade600,
          ),
        ),
        // SizedBox(
        //   width: 5,
        // ),
        ElevatedButton(
          onPressed: () {
            if (_quantity > 1) {
              setState(() {
                _quantity--;
              });
            }
          },
          child: Icon(
            FontAwesomeIcons.minus,
            size: 20,
          ),
          style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              minimumSize: MaterialStateProperty.all<Size>(Size(30, 30)),
              // fixedSize: MaterialStateProperty.all<Size>(Size(10, 20)),
              elevation: MaterialStateProperty.all(0),
              shape: MaterialStateProperty.all<CircleBorder>(CircleBorder())),
        ),
        Text(
          _quantity.toString(),
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _quantity++;
            });
          },
          child: Icon(
            FontAwesomeIcons.plus,
            size: 20,
          ),
          style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              minimumSize: MaterialStateProperty.all<Size>(Size(30, 30)),
              // fixedSize: MaterialStateProperty.all<Size>(Size(10, 20)),
              elevation: MaterialStateProperty.all(0),
              shape: MaterialStateProperty.all<CircleBorder>(CircleBorder())),
        ),
      ],
    );
  }
}
