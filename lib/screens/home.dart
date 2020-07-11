import 'package:covoid_19/components/home_carousel.dart';
import 'package:covoid_19/components/search_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: null),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: null),
        ],
      ),
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SearchBar(),
            HomeCarousel(),
          ],
        ),
      ),
    );
  }
}
