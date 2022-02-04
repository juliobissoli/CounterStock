import 'package:flutter/material.dart';
import './circular_indicator_default.dart';
import '../../theme/styles.dart';

class BtnDefault extends StatelessWidget {
  final VoidCallback func;
  final String label;
  final String ?mode;
  final bool is_loading;

  BtnDefault(
      {
      required this.func,
      @required this.label = "Teste",
      @required this.mode = "light",
      this.is_loading = false
      });

  @override
  Widget build(BuildContext context) {
    return !is_loading
        ? SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: mode == "light"
                    ? MaterialStateProperty.all<Color>(
                        func != null ? Colors.white : Color(0x88ffffff))
                    : MaterialStateProperty.all<Color>(
                        func != null ? Colors.black : Color(0x88000000)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              child: Text(label,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: _getTextColor(),
                      decorationColor: Colors.red)),
              onPressed: func,
              // onPressed: (){ Navigator.of(context).pushReplacementNamed('/');},
            ))
        : Container(
            alignment: Alignment.center, child: CircularIndicatorDefault());
  }

  _getTextColor() {
    if (this.mode == "light")
      return this.func != null ? Colors.black : BlakOpacity50;
    else
      return this.func != null ? Colors.white : WitheOpacity50;
  }
}
