import 'dart:convert';

import 'package:petfeeder/network/conn.dart';
import 'package:petfeeder/screens/bottomnav.dart';
import 'package:petfeeder/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<Login> {
  bool _isLoading = false;
  var email, password;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
            padding: EdgeInsets.only(top: 250.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      child: const Text(
                        'Pet Feeder',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      )),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        fillColor: Colors.black,
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                  ),
                  Container(
                      height: 50,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: MaterialButton(
                        textColor: Colors.white,
                        color: Colors.black,
                        child: Text('Login'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomNav()),
                          );
                          // if (_formKey.currentState!.validate()) {
                          //   _login(
                          //       emailController.text, passwordController.text);
                          // }
                        },
                      )),
                  Container(
                      child: Row(
                    children: <Widget>[
                      Text('Belum punya akun?'),
                      MaterialButton(
                        textColor: Colors.black,
                        child: Text(
                          'Daftar Disini',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Register()),
                          );
                        },
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ))
                ],
              ),
            )));
  }

  _login(String email, password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var data = {'email': email, 'password': password};
    var jsonResponse = null;
    var response = await Network().postData(data, 'login');
    jsonResponse = json.decode(response.body);
    print(jsonResponse);

    if (response.statusCode == 201) {
      sharedPreferences.setString('user', jsonResponse['user']['name']);

      if (jsonResponse != null) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => BottomNav()),
            (Route<dynamic> route) => false);
      }
    }

    setState(() {
      _isLoading = false;
    });
  }
}
