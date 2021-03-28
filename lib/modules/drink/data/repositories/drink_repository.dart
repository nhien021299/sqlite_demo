import 'package:injectable/injectable.dart';
import 'package:sqlite_demo/modules/drink/data/datasources/drink_datasource.dart';
import 'package:sqlite_demo/modules/drink/domain/models/drink.dart';

@lazySingleton
class DrinkRepository {
  final DrinkDatasource _drinkDatasource;

  DrinkRepository(this._drinkDatasource);

  Future<List<Drink>> getDrinks() => _drinkDatasource.getDrinks();

  Future addDrink(Drink drink) => _drinkDatasource.addDrink(drink);

  Future editDrink(Drink drink, int quantity) => _drinkDatasource.editDrink(drink, quantity);

  Future deleteDrink(int drinkId) => _drinkDatasource.deleteDrink(drinkId);

  Future clearDrinkQuantity(Drink drink) =>_drinkDatasource.clearDrinkQuantity(drink);
}