import 'dart:async';
//import 'dart:ffi';
import 'dart:io';
import 'package:conter_stock_app/state/scaner_state.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import '../../service/cs_api.dart';

class StockController extends ChangeNotifier {
  CsApi get api => CsApi.singleton;

  List<String> product_list = [];

  String error_api = '';

  final stateNotifier = ValueNotifier<ScannerState>(ScannerState.empty);

  set state(ScannerState state) => stateNotifier.value = state;
  ScannerState get state => stateNotifier.value;

  handleChangeQuantity(double quantity, String message_qr) async {
    var data = {"quantity": quantity, 'message_qr': message_qr};

    state = ScannerState.loading;

    try {
      await api.put('products', data);
      state = ScannerState.success;
    } on DioError catch (e) {
      print(e.response);
      this.error_api = 'Algo errado não esta certo';
      state = ScannerState.error;

      // if (this.error_api != '') {
      //   popdamorte(this.error_api);
      // }
    }
  }

  getQuantity(String code) async {
    //state = ScannerState.loading;

    try {
      final res = await api.api_get('products/' + code, null);
      print(res);
      // state = ScannerState.success;
    } on DioError catch (e) {
      print(e.response);
      this.error_api = 'Algo errado não esta certo';
      state = ScannerState.error;

      // if (this.error_api != '') {
      //   popdamorte(this.error_api);
      // }
    }
  }
}
