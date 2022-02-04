// import 'package:flutter/cupertino.dart';
// import 'package:stone_box_app/theme/styles.dart';
// // import 'package:flutter_svg/flutter_svg.dart';


// class LabelLine extends StatelessWidget {
//   final String label;
//   final String text_value;
//   final double max_width;

//   LabelLine({@required this.label, @required this.text_value, @required this.max_width});

//   @override
//   Widget build(BuildContext context) {
//     return Row(mainAxisAlignment: MainAxisAlignment.start,
//         // crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             width: (max_width * 0.2) ?? 40,
//             padding: const EdgeInsets.only(bottom: 8.0),
//             child: TextVale(
//               str: label + ':',
//               isLabel: false,
//               color_text: TextColorGray,
//             ),
//           ),
//           Container(
//             width: (max_width * 0.8) ?? 180,
//             padding: const EdgeInsets.only(bottom: 8.0),
//             child: TextVale(
//               str: text_value,
//               isLabel: true,
//               color_text: TextColorBlack66,
//             ),
//           ),
//         ]);
//   }
// }

// class SvgPicture {
// }

// class TextVale extends StatelessWidget {
//   final String str;
//   final bool isLabel;
//   final Color color_text;

//   TextVale({
//     @required this.str,
//      @required this.isLabel,
//      @required this.color_text
//      });

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       str,
//       style: TextStyle(
//         color: color_text,
//         fontWeight: isLabel ? FontWeight.w500 : FontWeight.w400,
//         fontSize: 16.0,
//       ),
//       overflow: TextOverflow.fade,
//       softWrap: false,
//     );
//   }
// }
