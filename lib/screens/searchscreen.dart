import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souqak/viewmodels/authviewmodel.dart';



class SearchScreen extends StatelessWidget {
  static const screenName = "search";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Container(
              height: 50,
              child: TextField(
                autofocus: true,
                enabled: true,
                decoration: InputDecoration(labelText: "Search",
                  border: OutlineInputBorder()
                ),

              ),
            ),
          )
        ],),
      ),
    );
  }
}
