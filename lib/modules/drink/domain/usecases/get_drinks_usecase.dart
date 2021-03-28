import 'package:injectable/injectable.dart';
import 'package:sqlite_demo/modules/drink/data/repositories/drink_repository.dart';
import 'package:sqlite_demo/modules/drink/domain/models/drink.dart';

@lazySingleton
class GetDrinkUsecase {
  final DrinkRepository _drinkRepository;

  GetDrinkUsecase(this._drinkRepository);

  Future<List<Drink>> call() => _drinkRepository.getDrinks();
}
