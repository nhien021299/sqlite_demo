import 'package:injectable/injectable.dart';
import 'package:sqlite_demo/modules/drink/data/repositories/drink_repository.dart';
import 'package:sqlite_demo/modules/drink/domain/models/drink.dart';

@lazySingleton
class ClearDrinkUsecase {
  final DrinkRepository _drinkRepository;

  ClearDrinkUsecase(this._drinkRepository);

  Future call(Drink drink) => _drinkRepository.clearDrinkQuantity(drink);
}