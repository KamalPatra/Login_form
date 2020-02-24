import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginState();
  }
}

class LoginState extends State {
  final TextEditingController _userController = new TextEditingController();
  final TextEditingController _userPassword = new TextEditingController();
  String _userName = "";

  void _erase() {
    setState(() {
      _userController.clear();
      _userPassword.clear();
    });
  }

  void _welcomeUser() {
    setState(() {
      if (_userController.text.isNotEmpty && _userPassword.text.isNotEmpty) {
        _userName = _userController.text;
      } else
        _userName = "Anonymous";
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      backgroundColor: Colors.white,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          children: <Widget>[
            new Image.asset(
              'images/face.png',
              width: 90.0,
              height: 90.0,
              color: Colors.deepPurpleAccent,
            ),
            new Container(
              height: 180.0,
              width: 380.0,
              color: Colors.deepPurpleAccent.shade100,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _userController,
                    decoration: new InputDecoration(
                      hintText: 'Username',
                      icon: new Icon(Icons.person),
                    ),
                  ),
                  new TextField(
                    controller: _userPassword,
                    decoration: new InputDecoration(
                      hintText: 'Password',
                      icon: new Icon(Icons.lock),
                    ),
                    obscureText: true,
                  ),
                  new Padding(padding: new EdgeInsets.all(18.0)),
                  new Center(
                    child: new Row(
                      children: <Widget>[
                        new Container(
                          margin: new EdgeInsets.only(left: 40.0),
                          child: new RaisedButton(
                            onPressed: _welcomeUser,
                            color: Colors.redAccent,
                            child: new Text(
                              'Login',
                              style: new TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        new Container(
                          margin: new EdgeInsets.only(left: 120.0),
                          child: new RaisedButton(
                            onPressed: _erase,
                            color: Colors.redAccent,
                            child: new Text(
                              'Clear',
                              style: new TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Padding(padding: const EdgeInsets.all(10.0)),
                new Text(
                  "Welcome $_userName",
                  style: new TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 30.0),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
