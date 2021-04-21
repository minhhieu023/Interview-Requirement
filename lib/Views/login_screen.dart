import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final solgan = Padding(
      padding: EdgeInsets.only(top: 30),
      child: Text(
        'Welcome Back',
        style: TextStyle(
            fontWeight: FontWeight.w400, color: Colors.grey, fontSize: 20),
        textAlign: TextAlign.start,
      ),
    );

    final userName = TextField(
      controller: userNameController,
      autofocus: false,
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.person,
            color: Colors.green,
          ),
          hintText: 'example',
          labelText: 'User name'),
    );

    final password = TextField(
      controller: passwordController,
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      autofocus: false,
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.security,
            color: Colors.green,
          ),
          labelText: 'Password'),
    );

    final loginbutton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        onPressed: () {
          if (userNameController.text == "hieuvm" &&
              passwordController.text == "passwor1")
            Navigator.pushReplacementNamed(context, "/store");
          else
            return showDialog<void>(
                context: context,
                //barrierDismissible: false, // user must tap button!
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Icon(Icons.close, color: Colors.red, size: 100),
                          Center(
                              child: Text('Username or password is incorrect')),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Try again'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                });
        },
        padding: EdgeInsets.all(12.0),
        color: Colors.green,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
        child: Text(
          'Log In',
          style: TextStyle(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w300),
        ),
      ),
    );

    final forgotlabel = FlatButton(
        onPressed: () {},
        child: Text(
          'Forgot Password?',
          style: TextStyle(
              color: Colors.green, fontSize: 15.0, fontWeight: FontWeight.w400),
        ));

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 30.0),
                    child: Container(
                      width: 220,
                      child: Center(
                          child: Text(
                        'LOGIN',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w400),
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                solgan,
                SizedBox(
                  height: 25.0,
                ),
                userName,
                SizedBox(
                  height: 25.0,
                ),
                password,
                SizedBox(
                  height: 25.0,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: forgotlabel,
                ),
                SizedBox(
                  height: 15.0,
                ),
                loginbutton,
              ]),
        ));
  }
}
