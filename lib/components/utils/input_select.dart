// import 'package:flutter/material.dart';

// class InputSelect<T> extends StatelessWidget {
//   final String hintText;
//   final List<T> options;
//   final T value;
//   final String Function(T) getLabel;
//   final void Function(T) onChanged;

//   InputSelect({
//     this.hintText = 'Please select an Option',
//     this.options = const [],
//     this.getLabel,
//     this.value,
//     this.onChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 48,
//       child: FormField<T>(
//         builder: (FormFieldState<T> state) {
//           return InputDecorator(
//             decoration: InputDecoration(
//               // hasFloatingPlaceholder: false,
//               fillColor: Colors.white,
//               filled: true,
//               contentPadding:
//                   EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
//               labelText: hintText,
//               border:
//                   OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
//             ),
//             isEmpty: value == null || value == '',
//             child: DropdownButtonHideUnderline(
//               child: DropdownButton<T>(
//                 value: value,
//                 isDense: true,
//                 onChanged: onChanged,
//                 items: options.map((T value) {
//                   return DropdownMenuItem<T>(
//                     value: value,
//                     child: Text(getLabel(value)),
//                   );
//                 }).toList(),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
