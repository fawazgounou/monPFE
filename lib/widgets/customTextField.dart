import 'package:flutter/material.dart';

class CustomTextField {
  final String title;
  final String placeholder;
  final bool ispass;
  final int line;
  String initialValue;
  String err;
  String _value = "";
  CustomTextField(
      {this.title = "",
      this.placeholder = "",
      this.ispass = false,
      this.err = "please complete",
      this.line = 1,
      required this.initialValue});
  TextEditingController controller = new TextEditingController();

  int i = 0;
  TextFormField textfrofield() {
    i++;
    if (i == 1) {
      controller.text = initialValue;
      _value = initialValue;
    }
    ;
    return TextFormField(
      controller: controller,
      maxLines: this.line,
      onChanged: (e) {
        _value = e;
      },
      validator: (e) => e!.isEmpty ? this.err : null,
      obscureText: this.ispass,
      decoration: InputDecoration(
          hintText: this.placeholder,
          hintStyle: TextStyle(color: Colors.white),
          labelText: this.title,
          labelStyle: TextStyle(color: Colors.white),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(1)),
          ),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white))),
    );
  }

  String get value {
    return _value;
  }
}
