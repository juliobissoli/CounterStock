import 'package:flutter/material.dart';

import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class LogoStineBox extends StatelessWidget {
  final double? size;

  LogoStineBox({@required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            image: Svg('assets/Images/Logo_CS.svg'), fit: BoxFit.cover),
      ),
    );
  }
}
