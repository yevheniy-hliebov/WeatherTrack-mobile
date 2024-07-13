class City {
  final int id;
  final String wikiDataId;
  final String type;
  final String city;
  final String name;
  final String country;
  final String countryCode;
  final String region;
  final String regionCode;
  final double latitude;
  final double longitude;
  final int population;

  City({
    required this.id,
    required this.wikiDataId,
    required this.type,
    required this.city,
    required this.name,
    required this.country,
    required this.countryCode,
    required this.region,
    required this.regionCode,
    required this.latitude,
    required this.longitude,
    required this.population,
  });

  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      id: map['id'],
      wikiDataId: map['wikiDataId'],
      type: map['type'],
      city: map['city'],
      name: map['name'],
      country: map['country'],
      countryCode: map['countryCode'],
      region: map['region'],
      regionCode: map['regionCode'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      population: map['population'],
    );
  }

  static List<City> fromMapList(List<dynamic> mapList) {
    return mapList.map((map) => City.fromMap(map)).toList();
  }

  String get nameAndCountryCode {
    return '$name, ${countryCode.toUpperCase()}';
  }
}
