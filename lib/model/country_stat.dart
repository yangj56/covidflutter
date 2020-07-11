class CountryStat {
  int id;
  String country;
  double lat;
  double lon;
  int totalCase;
  int activeCase;
  int todayCase;
  int death;
  DateTime lastUpdate;
  bool isPrimary;
  bool isSecondary;

  CountryStat(
      {this.country,
      this.id,
      this.lat,
      this.lon,
      this.totalCase,
      this.activeCase,
      this.todayCase,
      this.death,
      this.isPrimary,
      this.isSecondary,
      this.lastUpdate});

  void setCountryAsPrimary(bool isPrimary) {
    this.isPrimary = isPrimary;
  }

  void setCountryAsSecondary(bool isSecondary) {
    this.isSecondary = isSecondary;
  }
}
