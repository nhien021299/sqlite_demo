import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqlite_demo/injector.dart';
import 'package:sqlite_demo/modules/drink/app/ui/list_drink/list_drink_view_model.dart';
import 'package:sqlite_demo/modules/drink/domain/models/drink.dart';
import 'package:suga_core/suga_core.dart';

class CheckOut extends StatefulWidget {
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends BaseViewState<CheckOut, ListDrinkViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thanh Toán'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Color(0xFF2ac1bc),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: viewModel.drinks.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: viewModel.drinks[index].quantity != 0
                        ? Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            child: Container(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                        child: Text(
                                          '${viewModel.drinks[index].name}',
                                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                        child: Text(
                                          'Giá: ${viewModel.drinks[index].price},000 đ',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                                        child: Text(
                                          'Số lượng: ${viewModel.drinks[index].quantity}',
                                          style: TextStyle(fontSize: 13),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        : null,
                  );
                },
              ),
            ),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 200,
                height: 70,
                child: ElevatedButton(
                  child: Text('Tổng tiền:'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF2ac1bc),
                  ),
                ),
              ),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.only(right: 35),
                  child: Text(
                    '${viewModel.totalPrice()},000 đ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 200,
                height: 70,
                child: ElevatedButton(
                  child: Text('Số Lượng:'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF2ac1bc),
                  ),
                ),
              ),
              Obx(
                    () => Padding(
                  padding: const EdgeInsets.only(right: 35),
                  child: Text(
                    '${viewModel.totalQuantity()} Ly',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  ListDrinkViewModel createViewModel() => injector<ListDrinkViewModel>();
}
