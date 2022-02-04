import 'package:flutter/material.dart';

class InputPrimary extends StatelessWidget {
  final String ?label;
  final String ?type;
  final bool ?not_floating_label;
  TextInputType ?type_input;
  Function ?changed_call;
  final String ?sulfix;
  final Icon ?icon_sufix;
  final Function ?func_icon_sufix;
  final  TextCapitalization ?capitalization;
  final bool ?hasFloatingPlaceholder;
  TextEditingController ?controller_input;

  InputPrimary(
      {Key ?key,
      this.label = "",
      this.not_floating_label = false,
      this.type,
      required this.type_input,
      this.changed_call,
      required this.controller_input,
      this.sulfix = null,
      this.func_icon_sufix = null,
      this.icon_sufix = null,
      this.capitalization =  TextCapitalization.sentences,
      this.hasFloatingPlaceholder
      })
      : 
      assert(controller_input != Null),
      super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextField(
        controller: controller_input,
        // textCapitalization: capitalization ,
        // onChanged: changed_call,
        keyboardType: type_input,
        obscureText: this.type == "password",
        decoration: InputDecoration(
          // hintText: 'Email',
          // hasFloatingPlaceholder:(label.length > 0 && !not_floating_label) ? true : false,
          labelText: label,
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            gapPadding: 5,
            borderSide: new BorderSide(color: Colors.black),
          ),

          suffixText: sulfix != null ? sulfix : "",
        ),
      ),
    );
  }
}
