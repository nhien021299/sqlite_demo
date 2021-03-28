import 'package:flutter/material.dart';
import 'package:sqlite_demo/modules/drink/domain/models/drink.dart';

class DrinkItemWidget extends StatefulWidget {
  final Drink drink;
  final Function onItemDeleted;
  final Function increaseQuantity;
  final Function decreaseQuantity;
  final int itemTotalPrice;

  const DrinkItemWidget({Key key, this.drink, this.onItemDeleted, this.increaseQuantity, this.decreaseQuantity, this.itemTotalPrice})
      : super(key: key);

  @override
  _DrinkItemWidgetState createState() => _DrinkItemWidgetState();
}

class _DrinkItemWidgetState extends State<DrinkItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          width: double.infinity,
          child: Card(
            elevation: 2.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onLongPress: () {
                    widget.onItemDeleted();
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Text(
                          '${widget.drink.name}',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Text(
                          'Giá: ${widget.drink.price},000 đ',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Text(
                          'Tổng: ${widget.itemTotalPrice.toString()},000 đ',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                        icon: Icon(Icons.horizontal_rule),
                        onPressed: () {
                          widget.decreaseQuantity();
                        }),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        'Số lượng: ${widget.drink.quantity}',
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        widget.increaseQuantity();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
