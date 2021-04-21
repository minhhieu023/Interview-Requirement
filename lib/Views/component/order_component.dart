import 'package:flutter/material.dart';
import 'package:interview_requirement/DAL/database_helper.dart';

class OrderComponent extends StatefulWidget {
  final int id;
  final String cusName;
  final String cusPhone;
  final String cusAddress;
  final String model;
  final DateTime orderDate;
  OrderComponent(
      {Key key,
      this.id,
      this.cusName,
      this.cusPhone,
      this.cusAddress,
      this.model,
      this.orderDate})
      : super(key: key);

  @override
  _OrderComponentState createState() => _OrderComponentState();
}

class _OrderComponentState extends State<OrderComponent> {
  final dbHelper = DatabaseHelper.instance;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.pushNamed(context, "/order");
      },
      child: Container(
        //color: Colors.white,
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
              // changes position of shadow
            ),
          ],
        ),
        height: (MediaQuery.of(context).size.height -
                kToolbarHeight -
                kBottomNavigationBarHeight) *
            1 /
            3.8,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(children: [
                      Text(
                        "ID ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "#${widget.id}",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ]),
                  ),
                  Text(
                    "${widget.orderDate.toString()}",
                    style: TextStyle(color: Colors.black54),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  height: 100,
                  width: 140,
                  child: Image.asset("assets/tv.jpg", fit: BoxFit.fitWidth),
                ),
                Container(
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "${widget.model}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          "${widget.cusName}",
                          overflow: TextOverflow.visible,
                          maxLines: 2,
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width - 180,
                        child: Text("${widget.cusPhone}",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontStyle: FontStyle.italic)),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
