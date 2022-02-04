import 'dart:io';

import 'package:flutter/widgets.dart';

class ImageBox extends StatelessWidget {
  double? size;
  String? image_name;
  double? border_size;
  String? url_image;
  bool? is_local;
  bool? exist;

  ImageBox(
      {Key ?key,
      this.size = 60,
      this.image_name,
      this.border_size  = 2.0,
      this.url_image,
      this.is_local = true,
      this.exist = true
      })
      :  
      assert(size != null),
      assert (image_name != null),
      assert (border_size != null),
      assert (url_image != null),
      assert (is_local != null),
      assert (exist != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width * 0.35,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Color(0xff000000),
        borderRadius: BorderRadius.circular(15),
        image: exist ?? false
        ? DecorationImage(
            image:
            //  is_local ?? is_local ? FileImage(File(image_name)) :
             NetworkImage(url_image ?? ''),
            fit: BoxFit.cover)
        : null,
        border: Border.all(
          color: Color.fromRGBO(250, 250, 250, 1),
          width: border_size ?? 2.0,
        ),
      ),
    );
  }
}
