import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
part 'drink.g.dart';

@JsonSerializable(explicitToJson: true)
class Drink {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;

  @JsonKey(name: "quantity")
  int quantity;

  @JsonKey(name: "price")
  int price;

  Drink({this.name, this.id, this.quantity, this.price});

  factory Drink.fromJson(Map<String, dynamic> json) => _$DrinkFromJson(json);

  factory Drink.fromJsonString(String jsonString) => Drink.fromJson(json.decode(jsonString) as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$DrinkToJson(this);

  String toJsonString() => json.encode(toJson());
}