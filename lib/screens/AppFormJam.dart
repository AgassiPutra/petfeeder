import 'package:flutter/material.dart';

//AppForms untuk TextField CRUD Kategori

// ignore: must_be_immutable
class AppFormJam extends StatefulWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController jamController;

  // ignore: use_key_in_widget_constructors
  AppFormJam({required this.formKey, required this.jamController});

  @override
  _AppFormJamState createState() => _AppFormJamState();
}

class _AppFormJamState extends State<AppFormJam> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: widget.jamController,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Jam',
            ),
            style: const TextStyle(
                fontFamily: 'Poppins', fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
