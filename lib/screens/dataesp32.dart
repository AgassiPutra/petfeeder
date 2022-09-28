import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:petfeeder/model/esp32.dart';
import 'package:petfeeder/screens/tambahesp32.dart';
// import 'package:e_warung/screens/admin/updatekategori.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;
import 'package:petfeeder/env.dart';
import 'package:petfeeder/screens/updateesp32.dart';

class DataEsp extends StatefulWidget {
  const DataEsp({Key? key}) : super(key: key);

  @override
  _ESP32State createState() => _ESP32State();
}

class _ESP32State extends State<DataEsp> {
  late Future<List<ESP32>> esp32;
  final produkListKey = GlobalKey<_ESP32State>();
  int indexTab = 0;
  @override
  void initState() {
    super.initState();
    esp32 = getESP32List();
    refresh();
  }

  refresh() {
    setState(() {});
  }

  Future<List<ESP32>> getESP32List() async {
    final response =
        await http.get(Uri.parse("${Env.URL_PREFIX}/list_esp32.php"));
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<ESP32> esp32 = items.map<ESP32>((json) {
      return ESP32.fromJson(json);
    }).toList();

    return esp32;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: produkListKey,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('DATA ESP32',
              style: TextStyle(
                  fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
          backgroundColor: Colors.black,
        ),
        body: Stack(
          children: [
            buildListViewbyIndexESP32(),
            Positioned(
                bottom: 15,
                right: 15,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TambahESP32()),
                      );
                    },
                    child: const Icon(Icons.add),
                    backgroundColor: Colors.black,
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget buildListViewbyIndexESP32() {
    return FutureBuilder<List<ESP32>>(
      future: esp32,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        // By default, show a loading spinner.
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        // Render student lists
        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: snapshot.data.length,
          itemBuilder: (BuildContext context, int index) {
            var data = snapshot.data[index];
            return Container(
                height: 100,
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        leading: Container(
                            height: double.infinity,
                            child: const Icon(Icons.shop_2_rounded)),
                        title: Text(data.nama,
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400)),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          UpdateESP32(esp32: data)),
                                ),
                              },
                              icon: const Icon(Icons.edit),
                              iconSize: 30,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ));
          },
        );
      },
    );
  }
}
