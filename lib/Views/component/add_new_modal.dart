import 'package:flutter/material.dart';
import 'package:interview_requirement/DAL/database_helper.dart';
import 'package:interview_requirement/Models/order.dart';

class AddNewModal extends StatefulWidget {
  final storeId;
  final Function callBack;
  AddNewModal({Key key, this.storeId, this.callBack}) : super(key: key);

  @override
  _AddNewModalState createState() => _AddNewModalState();
}

class _AddNewModalState extends State<AddNewModal> {
  TextEditingController devicesController = new TextEditingController();
  TextEditingController fullNameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  final dbHelper = DatabaseHelper.instance;

  bool isClosedModal = false;

  Future<bool> _insert() async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnModel: devicesController.text,
      DatabaseHelper.columnName: fullNameController.text,
      DatabaseHelper.columnPhone: phoneController.text,
      DatabaseHelper.columnCusAddress: addressController.text,
      DatabaseHelper.columnOrderDate: DateTime.now().toString(),
      DatabaseHelper.columnEmployeeId: 1,
      DatabaseHelper.columnStoreId: widget.storeId,
    };
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
    if (id.isNaN) return false;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            "Add New",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: devicesController,
              //keyboardType: TextInputType,
              autofocus: false,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.devices,
                    color: Colors.grey,
                  ),
                  hintText: 'TV Samsung DCS3A32GV',
                  labelText: 'Devices'),
            )),
        Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              //keyboardType: TextInputType.emailAddress,
              controller: fullNameController,
              autofocus: false,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                  hintText: 'Nguyen Van A',
                  labelText: 'Full name'),
            )),
        Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: phoneController,
              keyboardType: TextInputType.number,
              autofocus: false,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Colors.grey,
                  ),
                  hintText: '0347576548',
                  labelText: 'Number phone'),
            )),
        Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: addressController,
              autofocus: false,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.streetview,
                    color: Colors.grey,
                  ),
                  hintText: '56, đường số 6, Thủ Đức',
                  labelText: 'Address'),
            )),
        Padding(
            padding: EdgeInsets.all(30),
            child: ButtonTheme(
              minWidth: 200.0,
              //height: 100.0,
              child: RaisedButton(
                onPressed: () async {
                  Order order = new Order();
                  order.cusName = fullNameController.text;
                  order.cusPhone = phoneController.text;
                  order.cusAddress = addressController.text;
                  order.model = devicesController.text;
                  order.employeeId = "1";
                  order.orderDate = DateTime.now().toString();
                  bool result = await _insert();
                  Navigator.pop(context);
                  widget.callBack();
                  showDialog<void>(
                      context: context,
                      //barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                result
                                    ? Icon(Icons.check_circle,
                                        color: Colors.green, size: 100)
                                    : Icon(Icons.close,
                                        color: Colors.red, size: 100),
                                Center(child: Text('Completed')),
                                RaisedButton(
                                    child: Text("Closed"),
                                    onPressed: () {
                                      Navigator.of(context, rootNavigator: true)
                                          .pop('dialog');
                                    }),
                              ],
                            ),
                          ),
                        );
                      });
                },
                padding: EdgeInsets.all(10.0),
                color: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0)),
                child: Text(
                  'Save',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300),
                ),
              ),
            )),
      ]),
    );
  }
}
