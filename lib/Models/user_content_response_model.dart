class UserContentResponseModel {
  String icao;
  //String iata;
  String name;
  String city;
  String state;
  String country;
  int elevation;
  double? lat;
  double? lon;
  String tz;

  UserContentResponseModel({
    required this.icao,
    //required this.iata,
    required this.name,
    required this.city,
    required this.state,
    required this.country,
    required this.elevation,
    required this.lat,
    required this.lon,
    required this.tz,
  });
}