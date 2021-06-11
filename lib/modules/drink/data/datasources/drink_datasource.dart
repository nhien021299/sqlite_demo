import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite_demo/core/exceptions/sqlite_exception.dart';
import 'package:sqlite_demo/modules/drink/domain/models/drink.dart';

abstract class DrinkDatasource {
  Future<List<Drink>> getDrinks();

  Future addDrink(Drink drink);

  Future editDrink(Drink drink, int quantity);

  Future deleteDrink(int drinkId);

  Future clearDrinkQuantity(Drink drink);
}

@LazySingleton(as: DrinkDatasource)
class DrinkDatasourceImpl implements DrinkDatasource {
  static const drinkTable = "Drinks";
  static const drinkColumnId = "id";
  static const drinkColumnName = "name";
  static const drinkColumnQuantity = "quantity";
  static const drinkColumnPrice = "price";

  final Database _db;

  DrinkDatasourceImpl(this._db);

  @override
  Future<List<Drink>> getDrinks() async {
    try {
      final rawDrinks = await _db.query(drinkTable);
      return rawDrinks.map((e) => Drink.fromJson(e)).toList();
    } catch (e) {
      throw SqliteException(e, "An error occurred while get a drink to database!");
    }
  }

  @override
  Future addDrink(Drink drink) {
    try {
      return _db.insert(drinkTable, drink.toJson());
    } catch (e) {
      throw SqliteException(e, "An error occurred while add account to database!");
    }
  }

  @override
  Future deleteDrink(int drinkId) async {
    try {
      return _db.delete(
        drinkTable,
        where: "$drinkColumnId = ?",
        whereArgs: [drinkId],
      );
    } catch (e) {
      throw SqliteException(e, "An error occurred while delete account in database!");
    }
  }

  @override
  Future editDrink(Drink drink, int quantity) {
    try {
      return _db.update(
        drinkTable,
        {
          drinkColumnQuantity: quantity,
        },
        where: "$drinkColumnId = ?",
        whereArgs: [drink.id],
      );
    } catch (e) {
      throw SqliteException(e, "An error occurred while edit account in database!");
    }
  }

  @override
  Future clearDrinkQuantity(Drink drink) {
    try {
      return _db.update(
        drinkTable,
        {
          drinkColumnQuantity: drink.quantity = 0,
        },
        where: "$drinkColumnId = ?",
        whereArgs: [drink.id],
      );
    } catch (e) {
      throw SqliteException(e, "An error occurred while edit account in database!");
    }
  }
}
