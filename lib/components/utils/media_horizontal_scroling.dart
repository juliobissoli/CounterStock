// import 'package:flutter/material.dart';
// import 'package:stone_box_app/components/new-stone/midia-box-widget.dart';
// import 'package:stone_box_app/components/utils/image_box.dart';
// import 'package:stone_box_app/core/models/new_stone_media_model.dart';

// class MediaScrollingHorizontal extends StatelessWidget {

//   final List<StoneMediaModel> list;
//   final double width_size;

//   MediaScrollingHorizontal({this.list, @required this.width_size});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: width_size,
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         // padding: EdgeInsets.symmetric(horizontal: 8),
//          children: list.map((image) =>
//            Container(
//              width: width_size,
//              height: width_size,
//              padding: const EdgeInsets.only(right: 8.0, top: 4, bottom: 4),
//              child: MediaBox(midia: image, have_action: true, size: 60,)
//            )
//          ).toList(),
//        ),
//     );
//   }
// }
