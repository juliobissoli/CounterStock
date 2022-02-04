// import 'package:flutter/material.dart';

// class TitlePage extends StatelessWidget {
//   final String title;
//   final Function func;
//   final Function chnage_view;
//   final bool is_search;

//   TitlePage(
//       {@required this.is_search,
//       @required this.title,
//       this.func = null,
//       this.chnage_view = null});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: 60,
//         padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             !is_search
//                 ? Text(
//                     title,
//                     style: TextStyle(fontSize: 22, color: Color(0xff404040)),
//                   )
//                 : Expanded(
//                     child: TextField(
//                         onChanged: this.func,
//                         decoration: InputDecoration(
//                           labelText: "Buscar por nome ou número",
//                           // hasFloatingPlaceholder: false,
//                           prefixIcon: Icon(Icons.search),
//                         )),
//                   ),
//             IconButton(
//               icon: !is_search
//                   ? const Icon(Icons.search, color: Color(0xff404040))
//                   : const Icon(Icons.close, color: Color(0xff404040)),
//               onPressed: this.chnage_view,
//             ),
//           ],
//         ));
//   }
// }
