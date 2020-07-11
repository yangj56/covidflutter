import 'dart:convert';
import 'package:covoid_19/const/common.dart';
import 'package:covoid_19/model/country_stat.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListStats with ChangeNotifier {
  List<CountryStat> _items = [];

  CountryStat get itemPrimary {
    var result = _items.firstWhere((element) => element.isPrimary);
    if (result == null) {
      return _items[0];
    }
    return result;
  }

  CountryStat get itemSecondary {
    var result = _items.firstWhere((element) => element.isSecondary);
    if (result == null) {
      return _items[0];
    }
    return result;
  }

  set setToPrimary(int id) {
    _items
        .firstWhere((element) => element.isPrimary)
        .setCountryAsPrimary(false);
    _items.firstWhere((element) => element.id == id).setCountryAsPrimary(true);
    notifyListeners();
  }

  set setToSecondary(int id) {
    _items
        .firstWhere((element) => element.isSecondary)
        .setCountryAsSecondary(false);
    _items
        .firstWhere((element) => element.id == id)
        .setCountryAsSecondary(true);
    notifyListeners();
  }

  Future<void> fetchAndSetStats(
      String country, DateTime startDate, DateTime endDate) async {
    print("Fetching data from api");
    // const arrayCountry
    const url = BASE_URL +
        "/country/south-africa?from=2020-06-01T00:00:00Z&to=2020-06-02T00:00:00Z";
    try {
      final response = await http.get(url);
      final extraData = json.decode(response.body) as List<dynamic>;
      final List<CountryStat> loadedProducts = [];
      extraData.forEach((value) {
        loadedProducts.add(CountryStat(
            lat: double.parse(value['Lat']),
            lon: double.parse(value['Lon']),
            totalCase: value['Confirmed'],
            death: value['Deaths'],
            todayCase: 0,
            activeCase: value['Active'],
            country: value['country'],
            lastUpdate: DateTime.now()));
      });
      _items = loadedProducts;
      notifyListeners();
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
