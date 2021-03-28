// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drink.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Drink _$DrinkFromJson(Map<String, dynamic> json) {
  return Drink(
    name: json['name'] as String,
    id: json['id'] as int,
    quantity: json['quantity'] as int,
    price: json['price'] as int,
  );
}

Map<String, dynamic> _$DrinkToJson(Drink instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'quantity': instance.quantity,
      'price': instance.price,
    };
