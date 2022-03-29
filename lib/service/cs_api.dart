import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CsApi {
  static final CsApi _csApi = CsApi._internal();
  CsApi._internal();
  static CsApi get singleton => _csApi;

  //static String base_url = 'http://192.168.15.40:3000';
  static String base_url =
      'https://e8b7-2804-7f2-5a4-5fd5-6494-b022-5f14-aba4.ngrok.io';

  String authToken = "";
  var rout = '';

  Dio _dioInstance = new Dio();

  Future<Response<dynamic>> api_get(String rout, dynamic data) async {
    this._dioInstance.options.headers["Authorization"] =
        "Bearer ${this.authToken}";
    this._dioInstance.options.headers['content-Type'] = 'application/json';

    return this._dioInstance.get('$base_url/$rout', queryParameters: data);
  }

  Future<Response> api_post(String rout, data) async {
    this._dioInstance.options.headers["Authorization"] =
        "Bearer ${this.authToken}";
    this._dioInstance.options.headers['content-Type'] = 'application/json';

    return this._dioInstance.post('$base_url/$rout', data: data);
  }

  Future<Response> put(String rout, data) async {
    this._dioInstance.options.headers["Authorization"] =
        "Bearer ${this.authToken}";
    this._dioInstance.options.headers['content-Type'] = 'application/json';
    return this._dioInstance.put('$base_url/$rout', data: data);
  }
}
