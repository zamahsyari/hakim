import 'package:flutter/material.dart';
import 'package:probation/helpers/dialog.dart';
//import 'package:probation/page/profile.dart';
//import 'package:http/http.dart' as http;
import 'dart:async';
//import 'dart:convert';
import 'package:probation/model/loginMdl.dart';
//import 'package:probation/helpers/dialog.dart' as dialog;
import 'package:probation/services/ApiSvc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  final usernameCTRL = TextEditingController();
  final passwordCTRL = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final storage = new FlutterSecureStorage();
  ApiSvc _apiService = ApiSvc();
  Future<LoginRes> res;

  Widget _actionButton(context) {
    return FlatButton(
      onPressed: () {
        Navigator.of(context).maybePop();
      },
      child: Text("Tutup"),
    );
  }

  Widget _loginhandler(context) {
    return FutureBuilder(
      future: res,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.status) {
            print("goddamn : " + snapshot.data.token);
            Navigator.of(context).maybePop();
          } else {
            return CustomDialogDismissable(
                title: "Perhatian",
                description: snapshot.data.message,
                button: _actionButton(context));
            //Text(snapshot.data.message);
          }
        } else if (snapshot.hasError) {
          return CustomDialogDismissable(
              title: "Perhatian",
              description: "Ups, koneksi bermasalah",
              button: _actionButton(context));
          //Text("Ups, koneksi bermasalah");
        }
        return Loady(description: "Loading");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.blue, //change your color here
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Login",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: <Widget>[
              Center(
                child: new Image.asset("assets/images/food1.jpg",
                    width: (MediaQuery.of(context).size).width,
                    height: (MediaQuery.of(context).size).height,
                    fit: BoxFit.fill),
              ),
              new Container(
                margin: EdgeInsets.all(20),
                child: Card(
                  color: Colors.white,
                  child: Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
                          _iconLogin(),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 50),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                    controller: usernameCTRL,
                                    decoration: const InputDecoration(
                                      border: UnderlineInputBorder(),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.black87,
                                          width: 1.5,
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 3.0),
                                      ),
                                      icon: Icon(Icons.person),
                                      hintText: "Username",
                                      hintStyle: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    style: TextStyle(color: Colors.black),
                                    autofocus: false,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 12.0),
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                    controller: passwordCTRL,
                                    decoration: const InputDecoration(
                                      border: UnderlineInputBorder(),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.black87,
                                          width: 1.5,
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 3.0),
                                      ),
                                      icon: Icon(Icons.lock),
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    style: TextStyle(color: Colors.black),
                                    obscureText: true,
                                    autofocus: false,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20, bottom: 20),
                            child: new ConstrainedBox(
                              constraints: const BoxConstraints(
                                  minWidth: double.infinity),
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(18.0),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 10),
                                color: Colors.blue,
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    String username =
                                        usernameCTRL.text.toString();
                                    String password =
                                        passwordCTRL.text.toString();
                                    LoginReq loginreq = LoginReq(
                                        username: username, password: password);
                                    print("username: " + username);
                                    res = _apiService.login(loginreq);
                                    showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return _loginhandler(context);
                                        });
                                  }
                                },
                                child: const Text('Login',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconLogin() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: CircleAvatar(
        radius: 30.0,
        backgroundImage: AssetImage('assets/images/alfabizz.jpeg'),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
