import 'package:covoid_19/provider/list_stats.dart';
import 'package:covoid_19/screens/country.dart';
import 'package:covoid_19/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ListStats(),
      child: MaterialApp(
        title: 'Covid Project',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'NotoSans',
          textTheme: TextTheme(
            headline1: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
            headline2: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
            bodyText1: TextStyle(
                fontSize: 14.0,
                fontStyle: FontStyle.italic,
                color: Colors.black),
          ),
        ),
        home: CountrySelectionScreen(),
      ),
    );
  }
}
