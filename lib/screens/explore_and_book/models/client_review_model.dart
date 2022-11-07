import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ClientReviewModel {
  String name;
  String className;
  String type;
  String message;
  int numberOfStars;
  String date;

  ClientReviewModel({
    required this.name,
    required this.className,
    required this.type,
    required this.message,
    required this.numberOfStars,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'className': className,
      'type': type,
      'message': message,
      'numberOfStars': numberOfStars,
      'date': date,
    };
  }

  factory ClientReviewModel.fromMap(Map<String, dynamic> map) {
    return ClientReviewModel(
      name: map['name'] as String,
      className: map['className'] as String,
      type: map['type'] as String,
      message: map['message'] as String,
      numberOfStars: map['numberOfStars'] as int,
      date: map['date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClientReviewModel.fromJson(String source) =>
      ClientReviewModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
