import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:sqlite_demo/modules/drink/domain/usecases/add_drink_usecase.dart';
import 'package:suga_core/suga_core.dart';
import 'package:fluttertoast/fluttertoast.dart';

@lazySingleton
class AddDialogViewModel extends BaseViewModel {
  final AddDrinkUsecase _addDrinkUsecase;

  String name;
  int price;
  int quantity;

  TextEditingController nameEditingController;
  TextEditingController priceEditingController;
  TextEditingController quantityEditingController;

  AddDialogViewModel(this._addDrinkUsecase);

  Future<void> onAddItem() async {
    return call(
      () {
        name = nameEditingController.text;
        price = int.parse(priceEditingController.text);
        quantity = int.parse(quantityEditingController.text);
        _addDrinkUsecase.call(name: name, price: price, quantity: quantity);
      },
      onSuccess: () {
        Get.back(result: true);
      },
      onFailure: (error) {
        Fluttertoast.showToast(msg: 'Please fill the blank');
      },
      showLoading: false,
    );
  }

  void onClickCancel() {
    Get.back();
  }

  void onClickSave() {
    Get.back();
  }

  @override
  void initState() {
    super.initState();
    nameEditingController = TextEditingController();
    priceEditingController = TextEditingController();
    quantityEditingController = TextEditingController();
  }

  @override
  void disposeState() {
    super.disposeState();
    nameEditingController.dispose();
    priceEditingController.dispose();
    quantityEditingController.dispose();
  }
}
