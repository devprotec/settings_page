// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ui';

class LocationActivites {
  final String activityName;
  final Color activityColor;
  final String activityImage;

  LocationActivites(this.activityName, this.activityColor, this.activityImage);

  String toJson() => json.encode(toMap());

  factory LocationActivites.fromJson(String source) =>
      LocationActivites.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'activityName': activityName,
      'activityColor': activityColor,
      'activityImage': activityImage,
    };
  }

  factory LocationActivites.fromMap(Map<String, dynamic> map) {
    return LocationActivites(
      map['activityName'] as String,
      map['activityColor'] as Color,
      map['activityImage'] as String,
    );
  }
}
