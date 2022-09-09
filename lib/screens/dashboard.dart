import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:graphic/graphic.dart';
import 'package:petfeeder/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  MapScreenState createState() => MapScreenState();
}

const data = [
  {'category': 'Shirts', 'sales': 5},
  {'category': 'Cardigans', 'sales': 20},
  {'category': 'Chiffons', 'sales': 36},
  {'category': 'Pants', 'sales': 10},
  {'category': 'Heels', 'sales': 10},
  {'category': 'Socks', 'sales': 20},
];

class MapScreenState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  var userData;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
        ),
        body: Container(
            height: 200,
            child: Chart(
              data: data,
              variables: {
                'category': Variable(
                  accessor: (Map map) => map['category'] as String,
                ),
                'sales': Variable(
                  accessor: (Map map) => map['sales'] as num,
                ),
              },
              elements: [LineElement()],
              axes: [
                Defaults.horizontalAxis,
                Defaults.verticalAxis,
              ],
            )));
  }
}
