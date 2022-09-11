// ignore: file_names
import 'package:flutter/material.dart';

//AppForms untuk TextField CRUD Kategori

// ignore: must_be_immutable
class AppFormESP32 extends StatefulWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController namaController;

  // ignore: use_key_in_widget_constructors
  AppFormESP32({required this.formKey, required this.namaController});

  @override
  _AppFormESP32State createState() => _AppFormESP32State();
}

class _AppFormESP32State extends State<AppFormESP32> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: widget.namaController,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nama Device',
            ),
            style: const TextStyle(
                fontFamily: 'Poppins', fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
