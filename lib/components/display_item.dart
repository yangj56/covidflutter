import 'package:flutter/material.dart';

class DisplayItem extends StatelessWidget {
  const DisplayItem({
    Key key,
    @required this.itemValue,
    @required this.icon,
    @required this.label,
  }) : super(key: key);

  final String itemValue;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            size: 40,
          ),
          Padding(padding: EdgeInsets.only(right: 10)),
          Text(
            label,
          ),
          Text(itemValue)
        ],
      ),
    );
  }
}
