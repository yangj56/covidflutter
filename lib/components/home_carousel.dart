import 'package:covoid_19/components/Statistics.dart';
import 'package:covoid_19/provider/list_stats.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeCarousel extends StatefulWidget {
  HomeCarousel({Key key}) : super(key: key);

  @override
  _HomeCarouselState createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  PageController _pageController;
  int initialPage = 1;
  int pageNum = 0;
  bool _isInit = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void didChangeDependencies() {
    if (_isInit == false) {
      //make api calls
      Provider.of<ListStats>(context)
          .fetchAndSetStats("", DateTime.now(), DateTime.now());
    }
    _isInit = true;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    print("Unmounting page");
  }

  currentPage(int pageNumber) {
    print(pageNumber);
    setState(() {
      pageNum = pageNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    var countryStats = Provider.of<ListStats>(context, listen: false);
    var primaryCountryStat = countryStats.itemPrimary;
    var secondaryCountryStat = countryStats.itemSecondary;
    return Column(
      children: <Widget>[
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CarouselTitle(title: "Country A", selected: 0 == pageNum),
            CarouselTitle(title: "Country B", selected: 1 == pageNum),
          ],
        )),
        Container(
            width: double.infinity,
            height: 500,
            child: PageView(
              controller: _pageController,
              onPageChanged: (pageNumber) => this.currentPage(pageNumber),
              children: <Widget>[
                Statistics(
                    dailyCases: primaryCountryStat.death,
                    growth: primaryCountryStat.death,
                    deathRate: primaryCountryStat.death),
                Statistics(
                    dailyCases: secondaryCountryStat.death,
                    growth: secondaryCountryStat.death,
                    deathRate: secondaryCountryStat.death),
              ],
            )),
      ],
    );
  }
}

class CarouselTitle extends StatelessWidget {
  const CarouselTitle({
    Key key,
    @required this.title,
    @required this.selected,
  }) : super(key: key);

  final bool selected;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(title,
          style: Theme.of(context).textTheme.headline1.copyWith(
              color: selected ? Colors.black : Colors.black.withOpacity(0.4))),
    );
  }
}
