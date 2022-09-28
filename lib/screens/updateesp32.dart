import 'dart:convert';

import 'package:petfeeder/model/esp32.dart';
import 'package:petfeeder/screens/AppFormESP32.dart';
import 'package:petfeeder/screens/bottomnav.dart';
import 'package:petfeeder/screens/dataesp32.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petfeeder/env.dart';

import 'dashboard.dart';

class UpdateESP32 extends StatefulWidget {
  final ESP32 esp32;
  UpdateESP32({required this.esp32});
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<UpdateESP32> {
  final formKey = GlobalKey<FormState>();
  TextEditingController namaController = TextEditingController();
  Future editESP32() async {
    return await http.post(
      Uri.parse("${Env.URL_PREFIX}/update_esp32.php"),
      body: {
        "id_device": widget.esp32.id.toString(),
        "nama_device": namaController.text,
      },
    );
  }

  void deleteESP32(context) async {
    await http.post(
      Uri.parse("${Env.URL_PREFIX}/delete_esp32.php"),
      body: {
        'id_device': widget.esp32.id.toString(),
      },
    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BottomNav()),
    ).then((value) => setState(() {}));
  }

  void confirmDeleteKategori(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text('Yakin ingin menghapus ESP32 ini ?'),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  onPrimary: Colors.red, primary: Colors.white),
              child: Icon(Icons.cancel),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  onPrimary: Colors.blue, primary: Colors.white),
              child: Icon(Icons.check_circle),
              onPressed: () => deleteESP32(context),
            ),
          ],
        );
      },
    );
  }

  void _onConfirm(context) async {
    await editESP32();
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(content: const Text('Data Berhasil Diubah')),
    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DataEsp()),
    ).then((value) => setState(() {}));
  }

  @override
  void initState() {
    super.initState();
    namaController = TextEditingController(text: widget.esp32.nama);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('UPDATE ESP32',
              style: TextStyle(
                  fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
              onPressed: () {
                confirmDeleteKategori(context);
              },
            )
          ],
          backgroundColor: Colors.black,
        ),
        body: Container(
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: 200.0,
                    color: Colors.black,
                    child: Column(
                      children: <Widget>[
                        Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, top: 20.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: AppFormESP32(
                    formKey: formKey, namaController: namaController),
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        onPrimary: Colors.white, primary: Colors.black),
                    child: const Text('Simpan',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700)),
                    onPressed: () {
                      _onConfirm(context);
                    },
                  )),
            ],
          ),
        ));
  }
}
