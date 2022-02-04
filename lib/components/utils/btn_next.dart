// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class BtnNext extends StatelessWidget {
//   Function func;
//   final String label;
//   final bool desable;
//   // final String mode;

//   BtnNext({
//     @required this.func,
//     @required this.label,
//     this.desable = true
//     // @required this.mode = "light"
//   });

//   @override
//   Widget build(BuildContext context) {
//     final Color color_btn = desable ? Color(0x88ffffff) : Colors.white;
//     return SizedBox(
//       width: double.infinity,
//       height: 48,
//       child: RaisedButton(
//         onPressed: desable ? null : func,
//         color: Colors.transparent,
//         // style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Text(
//               label,
//               style: TextStyle( color: color_btn, fontSize: 22, fontWeight: FontWeight.w400),),
//             SizedBox(width: 16),
//             Icon(CupertinoIcons.arrow_right, color: color_btn,),
//           ],
//         ),
//       ),
//     );
//   }
// }
