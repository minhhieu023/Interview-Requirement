import 'package:flutter/material.dart';
import 'package:interview_requirement/Views/component/add_new_modal.dart';
import 'package:interview_requirement/Views/component/store_component.dart';

import 'component/order_component.dart';

class OrderScreen extends StatefulWidget {
  OrderScreen({Key key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order History"),
      ),
      body: ListView(
        children: [
          OrderComponent(
            id: 1,
            cusName: "Võ Minh Hiếu",
            cusPhone: "0348845163",
            model: "TV Samsung TU8500",
          ),
          OrderComponent(
            id: 1,
            cusName: "Võ Minh Hiếu",
            cusPhone: "0348845163",
            model: "TV Samsung TU8500",
          ),
          OrderComponent(
            id: 1,
            cusName: "Võ Minh Hiếu",
            cusPhone: "0348845163",
            model: "TV Samsung TU8500",
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: AddNewModal());
            },
          );
        },
      ),
    );
  }
}
