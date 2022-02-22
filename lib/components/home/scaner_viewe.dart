import 'package:flutter/material.dart';
import '../utils/btn_default.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../utils/modal.dart';
import '../../core/controller/stock_controller.dart';
import 'package:dio/dio.dart';
//import '../../pages/login-page.dart';

class ScanerViewe extends StatefulWidget {
  const ScanerViewe({Key? key}) : super(key: key);

  @override
  _ScanerVieweState createState() => _ScanerVieweState();
}

class _ScanerVieweState extends State<ScanerViewe> {
  StockController stock_controller = StockController();
  Barcode? result;
  bool _loading = false;
  String? qr_data = '';
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  double _n = 1.0;
  TextEditingController _controlarquant = TextEditingController();
  List<bool> mode_view = [true, false];
  String errorapi = '';
  void initState() {
    int _n1 = _n.round();
    this._controlarquant.text = _n1.toString();
  }

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildQrView(context),
          Center(
              //   child: FloatingActionButton(
              // child: const Text("Scan"),
              // onPressed: () {
              //   _handleShowProductDetail(context);
              // },
              // ),
              ),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 400.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _handleShowProductDetail(BuildContext context) {
    print("-============ CLICO ++++++++++++");
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext builder) {
        return Modal(
            size_height: 350.0,
            show_top: false,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    //qr_data ?? '',
                    _separanome(qr_data!),
                    textAlign: TextAlign.left,
                    style: const TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
                const SizedBox(
                  width: 200.0,
                  height: 50.0,
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //     child: ToggleButtons(
                  //     children: <Widget>[
                  //       Icon(Icons.ac_unit),
                  //       Icon(Icons.call),
                  //       Icon(Icons.cake),
                  //     ],
                  //     onPressed: (int index) {
                  //       setState(() {
                  //         if(index == 0) mode_view = [true, false];
                  //         else mode_view = [true, false];
                  //         // mode_view[index] = !mode_view[index];
                  //       });
                  //     },
                  //     isSelected: mode_view,
                  // ),
                  //     ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        if (_separatudo(qr_data!) == 'Metro(s)') {
                          _n += 0.1;
                        } else {
                          _n++;
                        }
                        controller:
                        _controlarquant.text = _hanbleshowtextscreen(
                            _n, qr_data!); //_n.toString();
                      },
                      child: const Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(
                      width: 150.0,
                      child: TextField(
                        controller: _controlarquant,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(color: Colors.white)),
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 42.0),
                        textAlign: TextAlign.center,
                        textInputAction: TextInputAction.done,
                        onSubmitted: (ValueKey) {
                          _n = double.parse(_controlarquant.text);
                        },
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        if (_separatudo(qr_data!) == 'Metro(s)') {
                          _n -= 0.1;
                        } else {
                          _n--;
                        }
                        _controlarquant.text = _hanbleshowtextscreen(
                            _n, qr_data!); //_n.toString();
                      },
                      child: new Icon(Icons.remove, color: Colors.black),
                      backgroundColor: Colors.white,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    _separatudo(qr_data!),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: BtnDefault(
                      is_loading: _loading,
                      mode: 'light',
                      func: () async {
                        setState(() {
                          this._loading = true;
                        });
                        try {
                          var res = await this
                              .stock_controller
                              .handleChangeQuantity(_n, qr_data!);
                          popdavida(context);
                          this.result = null;
                        } on DioError catch (e) {
                          this.errorapi = 'Algo de errado não esta certo';
                          popdamorte(this.errorapi, context);
                          this.result = null;
                        }

                        Navigator.pop(context);
                        setState(() {
                          this._loading = false;
                        });
                      },
                      label: 'Atualizar',
                    )

                    // childe: ElevatedButton(
                    //   child: const Text('Atualizar'),
                    //   onPressed: () {this
                    //     .stock_controller
                    //     .handleChangeQuantity(_n, qr_data!);
                    // Navigator.pop(context);},
                    // ),
                    ),
              ],
            ));
      },
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      if (result == null) {
        _handleShowProductDetail(context);
        setState(() {
          result = scanData;
          qr_data = result?.code;
        });
      }
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    //log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

String _separatudo(String data) {
  final List<String> listalouca = data.split('@');
  String resultadolista = listalouca[2];
  if (resultadolista == 'r') {
    resultadolista = 'Metro(s)';
  } else {
    resultadolista = 'Unidade(s)';
  }
  return resultadolista;
}

String _separanome(String data) {
  final List<String> listalouca = data.split('@');
  String resultadolista = listalouca[1];
  return resultadolista;
}

void popdamorte(String errou, BuildContext context) {
  final snackBar = SnackBar(
    content: Text(
      errou,
      textAlign: TextAlign.left,
      style: const TextStyle(color: Colors.orange),
    ),
    action: SnackBarAction(
      label: 'Dismiss',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

String _hanbleshowtextscreen(double numerote, String data) {
  String nemo = '';
  int numero;

  if (_separatudo(data) == 'Metro(s)') {
    nemo = numerote.toStringAsFixed(2);
  } else {
    numero = numerote.round();
    nemo = numero.toString();
  }
  return nemo;
}

void popdavida(BuildContext context) {
  final snackBar = SnackBar(
    content: const Text(
      'Produto atualizado com sucesso',
      textAlign: TextAlign.left,
      style: TextStyle(color: Colors.orange),
    ),
    action: SnackBarAction(
      label: 'Dismiss',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
