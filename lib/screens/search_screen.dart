import 'package:flutter/material.dart';

class Search_Screen extends StatefulWidget {
  @override
  _Search_ScreenState createState() => _Search_ScreenState();
}

class _Search_ScreenState extends State<Search_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10),
              margin: EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8)),
              child: TextField(
                // controller: _controller,
                decoration: InputDecoration(
                    hintText: "Search...",
                    hintStyle: TextStyle(fontSize: 16),
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    border: InputBorder.none),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
