import 'package:flutter/material.dart';
import 'package:interview_requirement/Views/order_history_screen.dart';

class StoreComponent extends StatefulWidget {
  final String id;
  final String imagePath;
  final String storeName;
  final String storeLocation;

  StoreComponent(
      {Key key, this.id, this.imagePath, this.storeName, this.storeLocation})
      : super(key: key);

  @override
  _StoreComponentState createState() => _StoreComponentState();
}

class _StoreComponentState extends State<StoreComponent> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OrderScreen(storeId: widget.id)),
        );
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
                      )
                    ]),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  height: 110,
                  width: 110,
                  child: Image.asset("${widget.imagePath}", fit: BoxFit.cover),
                ),
                Container(
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "${widget.storeName}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          "${widget.storeLocation}",
                          overflow: TextOverflow.visible,
                          maxLines: 2,
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width - 180,
                        child: Text("Giờ hoạt động: 9AM ~ 10PM",
                            style: TextStyle(
                                color: Colors.green,
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
