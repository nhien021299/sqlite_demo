import 'package:injectable/injectable.dart';
import 'package:sqlite_demo/modules/drink/data/repositories/drink_repository.dart';
import 'package:sqlite_demo/modules/drink/domain/helpers/validations.dart';
import 'package:sqlite_demo/modules/drink/domain/models/drink.dart';

@lazySingleton
class AddDrinkUsecase {
  final DrinkRepository _drinkRepository;

  AddDrinkUsecase(this._drinkRepository);

  Future<Drink> call({
    String name,
    int quantity,
    int price,
  }) async {
    final drink = Drink(
      name: name,
      quantity: quantity,
      price: price,
    );
    await _drinkRepository.addDrink(drink);

    return drink;
  }
}
