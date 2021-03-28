import 'package:injectable/injectable.dart';
import 'package:sqlite_demo/modules/drink/data/repositories/drink_repository.dart';
import 'package:sqlite_demo/modules/drink/domain/models/drink.dart';

@lazySingleton
class DeleteDrinkUsecase {
  final DrinkRepository _drinkRepository;

  DeleteDrinkUsecase(this._drinkRepository);

  Future call(int drinkId) => _drinkRepository.deleteDrink(drinkId);
}
