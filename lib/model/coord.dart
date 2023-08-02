class Coord {
  final double lon;
  final double lat;
  Coord({required this.lon, required this.lat});

  factory Coord.fromJson(dynamic json) {
    return Coord(
      lon: json['lon'],
      lat: json['lat'],
    );
  }
}
