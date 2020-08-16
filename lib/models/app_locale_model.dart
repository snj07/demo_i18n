// To parse this JSON data, do
//
//     final appLocaleModel = appLocaleModelFromJson(jsonString);

import 'dart:convert';

import 'package:meta/meta.dart';

AppLocaleModel appLocaleModelFromJson(String str) =>
    AppLocaleModel.fromJson(json.decode(str));

String appLocaleModelToJson(AppLocaleModel data) => json.encode(data.toJson());

class AppLocaleModel {
  AppLocaleModel({
    @required this.languageCode,
    @required this.countryCode,
  });

  final String languageCode;
  final String countryCode;

  factory AppLocaleModel.fromJson(Map<String, dynamic> json) => json != null
      ? AppLocaleModel(
          languageCode: json["languageCode"],
          countryCode: json["countryCode"],
        )
      : null;

  Map<String, dynamic> toJson() => {
        "languageCode": languageCode,
        "countryCode": countryCode,
      };
}
