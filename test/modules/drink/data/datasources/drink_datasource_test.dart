import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sqlite_demo/core/exceptions/sqlite_exception.dart';
import 'package:sqlite_demo/modules/drink/data/datasources/drink_datasource.dart';
import 'package:sqlite_demo/modules/drink/domain/models/drink.dart';

import '../../../../src/mocks.dart';
import '../../../../src/models.dart';

void main() {
  DatabaseMock database;
  DrinkDatasource drinkDatasourceDatasource;
  Drink drink;

  setUp(() {
    database = DatabaseMock();
    drinkDatasourceDatasource = DrinkDatasourceImpl(database);
    drink = createDrink();
  });

  group("getDrinks", () {
    test('should return list of drink', () async {
      // arrange
      when(database.query(DrinkDatasourceImpl.drinkTable)).thenAnswer((_) async => [drink.toJson()]);
      // act
      final result = await drinkDatasourceDatasource.getDrinks();
      // assert
      expect(result[0].toJsonString(), drink.toJsonString());
    });

    test('should throw SqliteException when get error', () async {
      // arrange
      when(database.query(DrinkDatasourceImpl.drinkTable)).thenThrow(Exception());
      // act
      // assert
      expect(() async => drinkDatasourceDatasource.getDrinks(), throwsA(isA<SqliteException>()));
    });
  });

  group("addDrink", () {
    test('should call insert database row', () async {
      // arrange
      // act
      await drinkDatasourceDatasource.addDrink(drink);
      // assert
      verify(database.insert(DrinkDatasourceImpl.drinkTable, argThat(equals(drink.toJson()))));
    });

    test('should throw SqliteException when get add drink error', () async {
      // arrange
      when(database.insert(DrinkDatasourceImpl.drinkTable, drink.toJson())).thenThrow(Exception());
      // act
      // assert
      expect(() async => drinkDatasourceDatasource.addDrink(drink), throwsA(isA<SqliteException>()));
    });
  });

  group("deleteDrink", () {
    test('should call delete database row', () async {
      // arrange
      // act
      await drinkDatasourceDatasource.deleteDrink(drink.id);
      // assert
      verify(database.delete(
        DrinkDatasourceImpl.drinkTable,
        where: "${DrinkDatasourceImpl.drinkColumnId} = ?",
        whereArgs: [drink.id],
      ));
    });

    test('should throw SqliteException when get delete drink error', () async {
      // arrange
      when(database.delete(
        DrinkDatasourceImpl.drinkTable,
        where: "${DrinkDatasourceImpl.drinkColumnId} = ?",
        whereArgs: [drink.id],
      )).thenThrow(Exception());
      // act
      // assert
      expect(() async => drinkDatasourceDatasource.deleteDrink(drink.id), throwsA(isA<SqliteException>()));
    });
  });

  group("editDrink", () {
    test('should call update database', () async {
      // arrange
      const newQuantity = 28;
      final values = <String, int>{
        DrinkDatasourceImpl.drinkColumnQuantity: newQuantity,
      };
      // act
      await drinkDatasourceDatasource.editDrink(drink, newQuantity);
      // assert
      verify(database.update(
        DrinkDatasourceImpl.drinkTable,
        values,
        where: "${DrinkDatasourceImpl.drinkColumnId} = ?",
        whereArgs: [drink.id],
      ));
    });

    test('should throw SqliteException when edit drink error', () async {
      // arrange
      const newQuantity = 02;
      final values = <String, int>{
        DrinkDatasourceImpl.drinkColumnQuantity: newQuantity,
      };
      when(database.update(
        DrinkDatasourceImpl.drinkTable,
        values,
        where: "${DrinkDatasourceImpl.drinkColumnId} = ?",
        whereArgs: [drink.id],
      )).thenThrow(Exception());
      // act
      // assert
      expect(() async => drinkDatasourceDatasource.editDrink(drink, newQuantity), throwsA(isA<SqliteException>()));
    });
  });
}
