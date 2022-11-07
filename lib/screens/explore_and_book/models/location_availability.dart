import 'dart:convert';

class LocationAvailability {
  final String day;
  final String time;

  LocationAvailability(this.day, this.time);

  String toJson() => json.encode(toMap());

  factory LocationAvailability.fromJson(String source) =>
      LocationAvailability.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'day': day,
      'time': time,
    };
  }

  factory LocationAvailability.fromMap(Map<String, dynamic> map) {
    return LocationAvailability(
      map['day'] as String,
      map['time'] as String,
    );
  }
}
