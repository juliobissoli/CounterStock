// import 'package:flutter/material.dart';
// import 'package:stone_box_app/theme/styles.dart';

// class BtnOutline extends StatelessWidget {
//   Function func;
//   final String label;
//   final String mode;

//   BtnOutline({@required this.func, @required this.label, this.mode = "light"});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       height: 48,
//       child: ElevatedButton(
//         onPressed: func,
//         style: ButtonStyle(
//           // foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
//           backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
//           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//             RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(5),
//               side: BorderSide(color: _getColor()),
//             ),
//           ),
//         ),
//         child: Text(
//           label,
//           style: TextStyle(
//               color: _getColor(), fontSize: 22, fontWeight: FontWeight.w400),
//         ),
//       ),
//     );
//   }

//   _getColor() {
//     if (this.mode == "danger")
//       return this.func != null ? Colors.red[400] : Colors.red[50];
//     else
//       return this.func != null ? Colors.white : WitheOpacity50;
//   }
// }
