import 'dart:async';
import 'dart:ffi';
import 'dart:io';
//import 'dart:js';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import '../../service/cs_api.dart';

class StockController extends ChangeNotifier {
  CsApai get api => CsApai.singleton;

  List<String> product_list = [];

  Future<Response<dynamic>> handleChangeQuantity(
      double quantity, String message_qr) async {
    var data = {"quantity": quantity, 'message_qr': message_qr};
    return api.put('products', data);

    // try {
    // } on DioError catch (e) {
    //   print(e.response);
    //   this.errorapi = 'Algo errado não esta certo';
    //   if (this.errorapi != '') {
    //     popdamorte(this.errorapi);
    //   }
    // }
  }
}
