import 'package:flutter/material.dart';

class AddNewModal extends StatefulWidget {
  AddNewModal({Key key}) : super(key: key);

  @override
  _AddNewModalState createState() => _AddNewModalState();
}

class _AddNewModalState extends State<AddNewModal> {
  bool isClosedModal = false;
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
              keyboardType: TextInputType.emailAddress,
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
              keyboardType: TextInputType.emailAddress,
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
                onPressed: () {
                  print("Save");
                  showDialog<void>(
                      context: context,
                      //barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Icon(Icons.check_circle,
                                    color: Colors.green, size: 100),
                                Center(child: Text('Completed!')),
                                RaisedButton(
                                    child: Text("Closed"),
                                    onPressed: () {
                                      setState(() {
                                        isClosedModal ? false : true;
                                      });
                                      Navigator.of(context).pop();
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
