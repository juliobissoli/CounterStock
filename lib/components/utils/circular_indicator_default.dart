import 'package:flutter/material.dart';
import '../../theme/styles.dart';

class CircularIndicatorDefault extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new CircularProgressIndicator(
      backgroundColor: Colors.black,
      valueColor: AlwaysStoppedAnimation<Color>(TextColorGray),
      strokeWidth: 3,
    );
  }
}
