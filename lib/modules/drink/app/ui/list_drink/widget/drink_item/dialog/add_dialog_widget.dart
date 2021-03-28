import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:sqlite_demo/injector.dart';
import 'package:suga_core/suga_core.dart';
import 'add_dialog_view_model.dart';

class AddDialogWidget extends StatefulWidget {
  @override
  _AddDialogWidgetState createState() => _AddDialogWidgetState();
}

class _AddDialogWidgetState extends BaseViewState<AddDialogWidget, AddDialogViewModel> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.only(left: 15, right: 15),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)), side: BorderSide(color: Color(0xFFE2E8F5))),
      child: Container(
        decoration: const BoxDecoration(color: Color(0xFFFFFFFF), borderRadius: BorderRadius.all(Radius.circular(10))),
        height: 280,
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Text(
              'Add drink',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: SizedBox(
                height: 50,
                child: TextField(
                  controller: viewModel.nameEditingController,
                  decoration: const InputDecoration(
                    hintText: 'Drink name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(
                        color: Color(0xFFE2E8F5),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: SizedBox(
                height: 50,
                child: TextField(
                  controller: viewModel.priceEditingController,
                  decoration: const InputDecoration(
                      hintText: 'Price',
                      border:
                          OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)), borderSide: BorderSide(color: Color(0xFFE2E8F5)))),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: SizedBox(
                height: 50,
                child: TextField(
                  controller: viewModel.quantityEditingController,
                  decoration: const InputDecoration(
                      hintText: 'Quantity',
                      border:
                          OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)), borderSide: BorderSide(color: Color(0xFFE2E8F5)))),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: FlatButton(
                    height: 50,
                    minWidth: 150,
                    onPressed: viewModel.onClickCancel,
                    shape:
                        const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)), side: BorderSide(color: Color(0xFFFFFFFF))),
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: FlatButton(
                    height: 50,
                    minWidth: 150,
                    onPressed: () => viewModel.onAddItem(),
                    shape:
                        const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)), side: BorderSide(color: Color(0xFFFFFFFF))),
                    child: Text(
                      'Save',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
            // const SizedBox(
            //   height: 25,
            // ),
          ],
        ),
      ),
    );
  }

  @override
  AddDialogViewModel createViewModel() => injector<AddDialogViewModel>();
}
