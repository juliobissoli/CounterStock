// import 'package:flutter/material.dart';

// import 'package:stone_box_app/components/utils/label_column.dart';
// import 'package:stone_box_app/components/utils/svg_image_box.dart';
// import 'package:stone_box_app/theme/styles.dart';

// class StoneInfo extends StatelessWidget {

//    final String name_material;
//    final String type;
//    final int bloc_number;
//    final double width;
//    final double height;
//    final double weight;
//    final double diameter;
//   const StoneInfo({
//     @required this.name_material,
//     @required this.type,
//     @required this.bloc_number,
//     @required this.width,
//     @required this.height,
//     @required this.weight,
//     @required this.diameter,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // height: 200,
//       width: double.infinity,
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(color: TextColorBlack44)),
//       child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//         Container(
//           width: (MediaQuery.of(context).size.width * 0.5)  - 32,
//           child: Column(children: [
//             _InfoItem(label: "Nome do material:", text: name_material),
//             _InfoItem(label: "Tipo:", text: type),
//             _InfoItem(label: "Número do bloco:", text: bloc_number.toString()),
//           ]),
//         ),
//         Container(height: 120, child: VerticalDivider(color: TextColorBlack44)),
//         SizedBox(
//           width: MediaQuery.of(context).size.width * 0.3,
//           child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
//             _ImgLabel( image_name: "assets/Images/plan_cartesian_x.svg", value: width, unity: "m",),
//             _ImgLabel( image_name: "assets/Images/plan_cartesian_y.svg", value: height, unity: "m",),
//             _ImgLabel( image_name: "assets/Images/plan_cartesian_z.svg", value: diameter, unity: "m",),
//             _ImgLabel(image_name: "assets/Images/weight.svg", value: weight, unity: "Ton",)
//           ]),
//         )
//       ]),
//     );
//   }
// }

// class _InfoItem extends StatelessWidget {
//   final label;
//   final String text;

//   _InfoItem({this.label, this.text});

//   @override
//   Widget build(BuildContext context) {


//     return Container(
//       // width: 180,
//       padding: EdgeInsets.symmetric(vertical: 8),
//       child: LabelColumn(
//           label: label,
//           text: text,
//           text_stile: TextStyle(fontSize: 18, color: Colors.white),
//           label_stile: TextStyle(fontSize: 16, color: TextColorBlack66)),
//     );
//   }
// }

// _parseDoubleLabel(double value, String unity){
//   return value.toStringAsFixed(2).replaceAll(new RegExp(r'[.,]'), ',') + unity;
// }

// class _ImgLabel extends StatelessWidget {
//   final String image_name;
//   final double value;
//   final String unity;

//   _ImgLabel({this.image_name, this.value, this.unity});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(bottom: 8),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           SvgImage(assetName: image_name, size: 30,),
//           Text(
//             _parseDoubleLabel(value, unity),
//             style: TextStyle(color: Colors.white, fontSize: 16),
//           )
//         ],
//       ),
//     );
//   }
// }
