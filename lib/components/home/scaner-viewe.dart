import 'package:flutter/material.dart';
import '../utils/btn_default.dart';

class ScanerViewe extends StatefulWidget {
  const ScanerViewe({ Key? key }) : super(key: key);

  @override
  _ScanerVieweState createState() => _ScanerVieweState();
}

class _ScanerVieweState extends State<ScanerViewe> {
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Container(
          height: 100.0,
          width:  double.infinity,
          child: Center(child: Text("Scanersascascasc"))),
        // BtnDefault(label: 'Entrar', func: _handleLogin, mode: "dark",)
      ],
    );
  }

  _handleLogin(){
    print("ta aqui");
  }
}