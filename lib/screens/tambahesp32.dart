import 'package:petfeeder/screens/dataesp32.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;
import 'package:petfeeder/env.dart';
import 'AppFormESP32.dart';
import 'dashboard.dart';

class TambahESP32 extends StatefulWidget {
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<TambahESP32> {
  final formKey = GlobalKey<FormState>();
  TextEditingController namaController = TextEditingController();

  Future _createKategori() async {
    return await http.post(
      Uri.parse("${Env.URL_PREFIX}/create_esp32.php"),
      body: {
        "nama_device": namaController.text,
      },
    );
  }

  void _onConfirm(context) async {
    await _createKategori();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Dashboard()),
    ).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Tambah ESP32',
              style: TextStyle(
                  fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
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
                padding: const EdgeInsets.all(10),
                child: AppFormESP32(
                    formKey: formKey, namaController: namaController),
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.white,
                      primary: Colors.black,
                    ),
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
