import 'package:flutter/material.dart';

class LogoStineBox extends StatelessWidget {
  final double? size;

  LogoStineBox({@required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Color(0xff1D1D1B),
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            image: AssetImage('assets/Images/logo1024x1024.png'),
            fit: BoxFit.cover),
      ),
    );
  }
}
