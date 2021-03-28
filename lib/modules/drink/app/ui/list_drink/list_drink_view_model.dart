import 'dart:io';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:sqlite_demo/modules/drink/app/ui/list_drink/widget/drink_item/dialog/add_dialog_widget.dart';
import 'package:sqlite_demo/modules/drink/domain/models/drink.dart';
import 'package:sqlite_demo/modules/drink/domain/usecases/clear_drink_quantity.dart';
import 'package:sqlite_demo/modules/drink/domain/usecases/delete_drink_usecase.dart';
import 'package:sqlite_demo/modules/drink/domain/usecases/edit_account_usecase.dart';
import 'package:sqlite_demo/modules/drink/domain/usecases/get_drinks_usecase.dart';
import 'package:suga_core/suga_core.dart';

@injectable
class ListDrinkViewModel extends BaseViewModel {
  final GetDrinkUsecase _getDrinkUsecase;
  final DeleteDrinkUsecase _deleteDrinkUsecase;
  final EditDrinkUsecase _editDrinkUsecase;
  final ClearDrinkUsecase _clearDrinkUsecase;

  ListDrinkViewModel(this._getDrinkUsecase, this._deleteDrinkUsecase, this._editDrinkUsecase, this._clearDrinkUsecase);

  RxList<Drink> _drinks = RxList<Drink>();

  List<Drink> get drinks => _drinks.toList();

  RxString _selectImagePath = RxString();
  String get selectImagePath => _selectImagePath.value;

  @override
  void initState() {
    _initData();
    super.initState();
  }

  Future getImage(ImageSource imageSource) async {
    final picker = await ImagePicker().getImage(source: imageSource);
    if(picker != null){
      _selectImagePath.value = picker.path;
    }
  }

  void refreshQuantity() async {
    await call(() async {
      for(var item in drinks)
      await _clearDrinkUsecase.call(item);
    }, onSuccess: () => onRefresh(), showLoading: false);
  }


  int totalPrice() {
    var totalPrice = 0;
    for (var item in drinks) {
      totalPrice += item.price * item.quantity;
    }
    return totalPrice;
  }

  int totalQuantity() {
    var totalQuantity = 0;
    for (var item in drinks) {
      totalQuantity += item.quantity;
    }
    return totalQuantity;
  }

  int itemTotalPrice(Drink drink) {
    var itemTotalPrice = 0;
      itemTotalPrice = drink.price * drink.quantity;
    return itemTotalPrice;
  }

  Future onAddButtonClicked() async {
    var result = await Get.dialog(AddDialogWidget());
    if (result is bool && result) {
      onRefresh();
    }
  }

  Future onEditQuantity(int quantity, Drink drink) async {
    await call(() async {
      await _editDrinkUsecase.call(drink, quantity);
      _drinks.assignAll(await _getDrinkUsecase.call());
    });
  }

  Future onDeleteItem(Drink drink) async {
    Get.defaultDialog(
      title: "Are you sure ?",
      middleText: "",
      textConfirm: "Yes",
      textCancel: "No",
      onConfirm: () {
        Get.back();
        deleteItem(drink);
      },
      onCancel: () {
        Get.back();
      },
    );
    onRefresh();
  }

  void deleteItem(Drink drink) async {
    await call(
      () => _deleteDrinkUsecase.call(drink.id),
      onSuccess: () => onRefresh(),
      showLoading: false,
    );
  }

  Future increaseQuantity(Drink drink) async {
    await call(() async {
      await _editDrinkUsecase.call(drink, drink.quantity + 1);
    }, onSuccess: () => onRefresh(), showLoading: false);
  }

  Future decreaseQuantity(Drink drink) async {
    if (drink.quantity != 0) {
      await call(() async {
        await _editDrinkUsecase.call(drink, drink.quantity - 1);
      }, onSuccess: () => onRefresh(), showLoading: false);
    }
  }

  Future onRefresh() async {
    call(() async => _drinks.assignAll(await _getDrinkUsecase.call()), showLoading: false);
  }

  Future _initData() async {
    await call(
      () async {
        _drinks.assignAll(await _getDrinkUsecase.call());
      },
    );
  }
}
