import 'package:covoid_19/model/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountrySelectionScreen extends StatelessWidget {
  const CountrySelectionScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final countryLists = [
      Country(
        id: "test-1",
        asset: "assets/svg/ad.svg",
        description: "Beautiful country 1",
        name: "Belgium-1",
      ),
      Country(
        id: "test-2",
        asset: "assets/svg/ae.svg",
        description: "Beautiful country 2",
        name: "Belgium-2",
      ),
      Country(
        id: "test-3",
        asset: "assets/svg/af.svg",
        description: "Beautiful country 3",
        name: "Belgium-3",
      ),
      Country(
        id: "test-4",
        asset: "assets/svg/ag.svg",
        description: "Beautiful country 4",
        name: "Belgium-4",
      ),
      Country(
        id: "test-5",
        asset: "assets/svg/ai.svg",
        description: "Beautiful country 5",
        name: "Belgium-5",
      ),
      Country(
        id: "test-6",
        asset: "assets/svg/al.svg",
        description: "Beautiful country 6",
        name: "Belgium-6",
      ),
      Country(
        id: "test-7",
        asset: "assets/svg/am.svg",
        description: "Beautiful country 7",
        name: "Belgium-7",
      ),
    ];
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
                    child: SvgPicture.asset(countryLists[0].asset,
                        semanticsLabel: 'Acme Logo'),
                  ),
                  Text(countryLists[0].name),
                  Text(countryLists[0].description),
                  Text(countryLists[0].id)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
