import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:petfeeder/model/jam.dart';
import 'package:petfeeder/screens/tambahjam.dart';
// import 'package:e_warung/screens/admin/updatekategori.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;
import 'package:petfeeder/env.dart';

class DataJam extends StatefulWidget {
  const DataJam({Key? key}) : super(key: key);

  @override
  _JamState createState() => _JamState();
}

class _JamState extends State<DataJam> {
  late Future<List<Feeder>> datajam;
  final produkListKey = GlobalKey<_JamState>();
  @override
  void initState() {
    super.initState();
    datajam = getJamList();
    refresh();
  }

  refresh() {
    setState(() {});
  }

  Future<List<Feeder>> getJamList() async {
    final response =
        await http.get(Uri.parse("${Env.URL_PREFIX}/list_jam.php"));
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<Feeder> datajam = items.map<Feeder>((json) {
      return Feeder.fromJson(json);
    }).toList();

    return datajam;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: produkListKey,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('DATA JAM',
              style: TextStyle(
                  fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
          backgroundColor: Colors.black,
        ),
        body: Stack(
          children: [
            buildListViewbyIndexKategori(),
            Positioned(
                bottom: 15,
                right: 15,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TambahJam()),
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

  Widget buildListViewbyIndexKategori() {
    return FutureBuilder<List<Feeder>>(
      future: datajam,
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
                        title: Text(data.jam,
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400)),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () => {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) =>
                                //           UpdateKategori(kategori: data)),
                                // ),
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
