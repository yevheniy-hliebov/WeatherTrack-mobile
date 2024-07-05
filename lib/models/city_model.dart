class CityModel {
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

  CityModel({
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

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
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

  static List<CityModel> fromMapList(List<dynamic> mapList) {
    return mapList.map((map) => CityModel.fromMap(map)).toList();
  }
}
