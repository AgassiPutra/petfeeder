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

class MapScreenState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(left: 15, top: 60),
          child: Row(
            children: <Widget>[
              Column(
                children: [
                  Text(
                    "Selamat Datang,",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                        fontSize: 14),
                  ),
                  Text(
                    "Agassi",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {},
              ),
            ],
          ),
        ),
        Container(
          height: 100,
          color: Colors.green,
          padding: const EdgeInsets.only(left: 15, top: 15),
          child: Row(
            children: <Widget>[
              Icon(Icons.sunny),
              Flexible(
                child: Column(
                  children: [
                    Text(
                      "28°C",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.normal,
                          fontSize: 14),
                    ),
                    Text(
                      "Suhu ruangan terlampau tinggi , mungkin bisa menurunkan suhu agar kucing tidak mudah kepanasan",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.normal,
                          fontSize: 12),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Text("Halo"))
      ],
    ));
  }
}
