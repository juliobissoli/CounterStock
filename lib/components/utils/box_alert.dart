// import 'package:flutter/material.dart';

// class CustomAlertDialog extends StatelessWidget {
//   final Color ?bgColor;
//   final String ?title;
//   final String ?message;
//   final String ?positiveBtnText;
//   final String ?negativeBtnText;
//   final Function ?onPostivePressed;
//   final Function ?onNegativePressed;
//   final double ?circularBorderRadius;
//   final Widget ?child;

//   CustomAlertDialog({
//     this.child,
//     this.title,
//     this.message,
//     this.circularBorderRadius = 15.0,
//     this.bgColor = Colors.white,
//     this.positiveBtnText,
//     this.negativeBtnText,
//     this.onPostivePressed,
//     this.onNegativePressed,
//   })  : assert(bgColor != null),
//         assert(circularBorderRadius != null);

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: title != null ? Text(title) : null,
//       content: child,
//       backgroundColor: bgColor,
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(circularBorderRadius!)),
//       actions: <Widget>[
//         negativeBtnText!
//             ? FlatButton(
//                 child: Text(negativeBtnText),
//                 textColor: Colors.red,
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                   if (onNegativePressed != null) {
//                     onNegativePressed();
//                   }
//                 },
//               )
//             : null,
//         positiveBtnText != null
//             ? FlatButton(
//                 child: Text(positiveBtnText),
//                 textColor: Theme.of(context).accentColor,
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                   if (onPostivePressed != null) {
//                     onPostivePressed();
//                   }
//                 },
//               )
//             : null,
//       ],
//     );
//   }

//   // showDialog(context: context, builder: (BuildContext context) => dialog);
// }
