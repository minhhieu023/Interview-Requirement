import 'package:flutter/material.dart';
import 'package:interview_requirement/DAL/database_helper.dart';
import 'package:interview_requirement/Views/component/add_new_modal.dart';

import 'component/order_component.dart';

class OrderScreen extends StatefulWidget {
  final storeId;
  OrderScreen({Key key, this.storeId}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final dbHelper = DatabaseHelper.instance;
  bool loadView = false;
  void callBack() {
    setState(() {
      loadView ? loadView = false : loadView = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order History"),
      ),
      body: FutureBuilder(
        future: dbHelper.getOrderList("${widget.storeId}"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                var date = DateTime.parse(snapshot.data[index].orderDate);
                return OrderComponent(
                  id: snapshot.data[index].id,
                  cusName: snapshot.data[index].cusName,
                  cusPhone: snapshot.data[index].cusPhone,
                  model: snapshot.data[index].model,
                  cusAddress: snapshot.data[index].cusAddress,
                  orderDate: date,
                );
              },
            );
          } else {
            return Container(
                child: Center(
              child: CircularProgressIndicator(
                semanticsLabel: 'Loading',
              ),
            ));
          }
        },
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
                  child:
                      AddNewModal(storeId: widget.storeId, callBack: callBack));
            },
          );
        },
      ),
    );
  }
}
