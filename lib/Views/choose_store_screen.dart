import 'package:flutter/material.dart';
import 'package:interview_requirement/Views/component/store_component.dart';

class ChooseCompany extends StatefulWidget {
  ChooseCompany({Key key}) : super(key: key);

  @override
  _ChooseCompanyState createState() => _ChooseCompanyState();
}

class _ChooseCompanyState extends State<ChooseCompany> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Choose store"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              height:
                  (MediaQuery.of(context).size.height - kToolbarHeight) * 0.1,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/hieu.jpg"),
                  radius: 30,
                ),
                title: Text(
                  "Võ Minh Hiếu",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text("Nhân viên bán hàng"),
              ),
            ),
            Container(
                height:
                    (MediaQuery.of(context).size.height - kToolbarHeight) * 0.9,
                child: ListView(
                  children: [
                    StoreComponent(
                      id: "12134",
                      imagePath: "assets/store.png",
                      storeName: "Điện máy xanh - Lê Văn Việt",
                      storeLocation: "196, Lê Văn Việt, P.1, HCM",
                    ),
                    StoreComponent(
                      id: "221232",
                      imagePath: "assets/store.png",
                      storeName: "Samsung store - Thủ Đức",
                      storeLocation: "196, Võ Văn Ngân, Thủ Đức, P.1, HCM",
                    ),
                    StoreComponent(
                      id: "12134",
                      imagePath: "assets/store.png",
                      storeName: "Thế giới di động - Xa lộ Hà Nội",
                      storeLocation: "233, Xa lộ Hà Nội, Thủ Đức, HCM",
                    ),
                  ],
                )),
          ],
        )));
  }
}
