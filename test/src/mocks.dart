import 'package:mockito/mockito.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite_demo/modules/drink/data/datasources/drink_datasource.dart';
import 'package:sqlite_demo/modules/drink/data/repositories/drink_repository.dart';
import 'package:sqlite_demo/modules/drink/domain/usecases/add_drink_usecase.dart';

class DrinkRepositoryMock extends Mock implements DrinkRepository {}

class DrinkDatasourceMock extends Mock implements DrinkDatasource {}

class AddDrinkUsecaseMock extends Mock implements AddDrinkUsecase {}

class DatabaseMock extends Mock implements Database {}
