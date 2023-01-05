

class Location {
  double? lat;
  double? lng;

  Location({this.lat, this.lng});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      lat: json['lat'],
      lng: json['lng'],
    );
  }


  @override
  String toString() {
    return '{ lat = ${this.lat}, lng = ${this.lng} }';
  }
}