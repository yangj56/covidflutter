import 'package:flutter/material.dart';

enum Section {
  GENERAL,
  BREAKING,
  VACCINES,
}

extension SectionExtension on Section {
  String get title {
    switch (this) {
      case Section.GENERAL:
        return 'General Info';
      case Section.BREAKING:
        return 'Breaking News';
      case Section.VACCINES:
        return 'Vaccines Discovery';
      default:
        return null;
    }
  }
}

class HomeSection extends StatefulWidget {
  HomeSection({Key key}) : super(key: key);

  @override
  _HomeSectionState createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> {
  int selectedSection = 0;
  List<Section> homeSections = [
    Section.BREAKING,
    Section.GENERAL,
    Section.VACCINES
  ];

  _setSelectedSection(index) {
    print("index" + index.toString());
    setState(() {
      selectedSection = index;
    });
  }

  Widget buildCategory(int index, BuildContext context) {
    return GestureDetector(
      onTap: () => _setSelectedSection(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              homeSections[index].title,
              style: Theme.of(context).textTheme.headline5.copyWith(
                  fontWeight: FontWeight.w600,
                  color: selectedSection == index
                      ? Colors.black
                      : Colors.black.withOpacity(0.3)),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: selectedSection == index
                      ? Colors.red[100]
                      : Colors.transparent),
              width: 40,
              height: 5,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: 60,
        child: ListView.builder(
          itemCount: homeSections.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (item, index) => buildCategory(index, context),
        ),
      ),
    );
  }
}
