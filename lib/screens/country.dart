import 'package:covoid_19/const/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountrySelectionScreen extends StatelessWidget {
  const CountrySelectionScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.red[100],
                  borderRadius: BorderRadius.circular(30)),
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: SvgPicture.asset(countryList[0].asset,
                        semanticsLabel: 'Acme Logo'),
                  ),
                  Text(countryList[0].name),
                  Text(countryList[0].description),
                  Text(countryList[0].id)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
