// To parse this JSON data, do
//
//     final apiResponse = apiResponseFromJson(jsonString);

import 'dart:convert';

ApiResponse apiResponseFromJson(String str) =>
    ApiResponse.fromJson(json.decode(str));

class ApiResponse {
  ApiResponse({
    this.errorCode,
    this.statusCode,
    this.isSuccess,
    this.isError,
    this.isServerError,
    this.isClientError,
    this.isInformational,
  });

  final String? errorCode;
  final int? statusCode;
  final bool? isSuccess;
  final bool? isError;
  final bool? isServerError;
  final bool? isClientError;
  final bool? isInformational;

  factory ApiResponse.fromJson(Map<String, dynamic>? json) => ApiResponse(
        errorCode: json!["errorCode"],
        statusCode: json["statusCode"],
        isSuccess: json["isSuccess"],
        isError: json["isError"],
        isServerError: json["isServerError"],
        isClientError: json["isClientError"],
        isInformational: json["isInformational"],
      );
}
