import 'package:covoid_19/components/display_item.dart';
import 'package:covoid_19/provider/list_stats.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Statistics extends StatelessWidget {
  const Statistics({
    Key key,
    @required this.dailyCases,
    @required this.growth,
    @required this.deathRate,
  }) : super(key: key);

  final int dailyCases;
  final int growth;
  final int deathRate;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.red[100]),
            width: size.width,
            child: Column(
              children: <Widget>[
                DisplayItem(
                  itemValue: dailyCases.toString(),
                  icon: Icons.language,
                  label: "Daily Cases",
                ),
                DisplayItem(
                  itemValue: growth.toString() + "%",
                  icon: Icons.track_changes,
                  label: "Growth",
                ),
                DisplayItem(
                  itemValue: deathRate.toString() + "%",
                  icon: Icons.mood_bad,
                  label: "Death Rate",
                ),
              ],
            ),
          ),
          Positioned(
              right: 0,
              child: IconButton(
                  icon: Icon(
                    Icons.refresh,
                    size: 30,
                    color: Colors.black,
                  ),
                  onPressed: null))
        ],
      ),
    );
  }
}
