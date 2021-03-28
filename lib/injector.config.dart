// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i8;
import 'package:shared_preferences/shared_preferences.dart' as _i9;
import 'package:sqflite/sqflite.dart' as _i3;
import 'package:suga_core/suga_core.dart' as _i14;

import 'injector.dart' as _i17;
import 'modules/drink/app/ui/list_drink/list_drink_view_model.dart' as _i15;
import 'modules/drink/app/ui/list_drink/widget/drink_item/dialog/add_dialog_view_model.dart'
    as _i16;
import 'modules/drink/app/ui/test_view_model.dart' as _i10;
import 'modules/drink/data/datasources/drink_datasource.dart' as _i4;
import 'modules/drink/data/repositories/drink_repository.dart' as _i5;
import 'modules/drink/domain/usecases/add_drink_usecase.dart' as _i11;
import 'modules/drink/domain/usecases/clear_drink_quantity.dart' as _i12;
import 'modules/drink/domain/usecases/delete_drink_usecase.dart' as _i13;
import 'modules/drink/domain/usecases/edit_account_usecase.dart' as _i6;
import 'modules/drink/domain/usecases/get_drinks_usecase.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String environment, _i2.EnvironmentFilter environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final mainModule = _$MainModule();
  await gh.lazySingletonAsync<_i3.Database>(() => mainModule.getDatabase(),
      preResolve: true);
  gh.lazySingleton<_i4.DrinkDatasource>(
      () => _i4.DrinkDatasourceImpl(get<_i3.Database>()));
  gh.lazySingleton<_i5.DrinkRepository>(
      () => _i5.DrinkRepository(get<_i4.DrinkDatasource>()));
  gh.lazySingleton<_i6.EditDrinkUsecase>(
      () => _i6.EditDrinkUsecase(get<_i5.DrinkRepository>()));
  gh.lazySingleton<_i7.GetDrinkUsecase>(
      () => _i7.GetDrinkUsecase(get<_i5.DrinkRepository>()));
  gh.lazySingleton<_i8.Logger>(() => mainModule.getLogger());
  await gh.lazySingletonAsync<_i9.SharedPreferences>(
      () => mainModule.getSharePreferences(),
      preResolve: true);
  gh.lazySingleton<_i10.TestViewModel>(() => _i10.TestViewModel());
  gh.lazySingleton<_i11.AddDrinkUsecase>(
      () => _i11.AddDrinkUsecase(get<_i5.DrinkRepository>()));
  gh.lazySingleton<_i12.ClearDrinkUsecase>(
      () => _i12.ClearDrinkUsecase(get<_i5.DrinkRepository>()));
  gh.lazySingleton<_i13.DeleteDrinkUsecase>(
      () => _i13.DeleteDrinkUsecase(get<_i5.DrinkRepository>()));
  gh.lazySingleton<_i14.HttpClientWrapper>(
      () => mainModule.getHttpClientWrapper(get<_i8.Logger>()));
  gh.factory<_i15.ListDrinkViewModel>(() => _i15.ListDrinkViewModel(
      get<_i7.GetDrinkUsecase>(),
      get<_i13.DeleteDrinkUsecase>(),
      get<_i6.EditDrinkUsecase>(),
      get<_i12.ClearDrinkUsecase>()));
  gh.lazySingleton<_i16.AddDialogViewModel>(
      () => _i16.AddDialogViewModel(get<_i11.AddDrinkUsecase>()));
  return get;
}

class _$MainModule extends _i17.MainModule {}
