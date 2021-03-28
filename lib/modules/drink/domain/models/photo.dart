import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'photo.g.dart';

@JsonSerializable(explicitToJson: true)
class Photo{
  @JsonKey(name: "photoName")
  String photoName;

  Photo({this.photoName});
  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  factory Photo.fromJsonString(String jsonString) => Photo.fromJson(json.decode(jsonString) as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$PhotoToJson(this);

  String toJsonString() => json.encode(toJson());
}