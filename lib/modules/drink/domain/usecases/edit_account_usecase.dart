import 'package:injectable/injectable.dart';
import 'package:sqlite_demo/modules/drink/data/repositories/drink_repository.dart';
import 'package:sqlite_demo/modules/drink/domain/models/drink.dart';

@lazySingleton
class EditDrinkUsecase {
  final DrinkRepository _drinkRepository;

  EditDrinkUsecase(this._drinkRepository);

  Future call(Drink drink, int quantity) => _drinkRepository.editDrink(drink, quantity);
}
