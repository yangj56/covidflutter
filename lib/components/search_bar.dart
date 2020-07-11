import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.green[100], borderRadius: BorderRadius.circular(20)),
      child: TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.white),
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: 40,
            )),
      ),
    );
  }
}
