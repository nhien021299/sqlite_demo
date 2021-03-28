import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqlite_demo/injector.dart';
import 'package:sqlite_demo/modules/drink/app/ui/check_out/check_out.dart';
import 'package:sqlite_demo/modules/drink/app/ui/list_drink/list_drink_view_model.dart';
import 'package:sqlite_demo/modules/drink/app/ui/list_drink/widget/drink_item/drink_item_widget.dart';
import 'package:sqlite_demo/modules/drink/app/ui/test.dart';
import 'package:suga_core/suga_core.dart';

class ListDrinkPage extends StatefulWidget {
  @override
  _ListDrinkPageState createState() => _ListDrinkPageState();
}

class _ListDrinkPageState extends BaseViewState<ListDrinkPage, ListDrinkViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Menu'),
        backgroundColor: Color(0xFF2ac1bc),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              viewModel.onAddButtonClicked();
            },
          ),
          IconButton(
            icon: Icon(Icons.picture_in_picture_alt),
            onPressed: () {
              Get.to(() => Test());
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          viewModel.refreshQuantity();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 600,
              width: double.infinity,
              child: Obx(() => viewModel.selectImagePath == null
                  ? ListView.builder(
                      itemCount: viewModel.drinks?.length ?? 0,
                      itemBuilder: (context, index) {
                        return DrinkItemWidget(
                          drink: viewModel.drinks[index],
                          itemTotalPrice: viewModel.itemTotalPrice(viewModel.drinks[index]),
                          onItemDeleted: () {
                            viewModel.onDeleteItem(viewModel.drinks[index]);
                          },
                          increaseQuantity: () {
                            viewModel.increaseQuantity(viewModel.drinks[index]);
                          },
                          decreaseQuantity: () {
                            viewModel.decreaseQuantity(viewModel.drinks[index]);
                          },
                        );
                      },
                    )
                  : Image.file(File(viewModel.selectImagePath))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 70,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(
                          () => CheckOut(),
                        );
                      },
                      child: Text(
                        'Thanh Toán',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF2ac1bc),
                      ),
                    ),
                  ),
                ),
                // Obx(
                //   () => Padding(
                //     padding: const EdgeInsets.only(right: 35),
                //     child: Text(
                //       '${viewModel.totalPrice()},000 đ',
                //       style: TextStyle(
                //         fontSize: 20,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  ListDrinkViewModel createViewModel() => injector<ListDrinkViewModel>();
}
