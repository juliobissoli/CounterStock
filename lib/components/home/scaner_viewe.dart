import 'package:flutter/material.dart';
import '../utils/btn_default.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../utils/modal.dart';
import '../../core/controller/stock_controller.dart';

class ScanerViewe extends StatefulWidget {
  const ScanerViewe({Key? key}) : super(key: key);

  @override
  _ScanerVieweState createState() => _ScanerVieweState();
}

class _ScanerVieweState extends State<ScanerViewe> {
  StockController stock_controller = StockController();
  Barcode? result;
  String? qr_data = '';
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  double _n = 1.0;
  TextEditingController _controlarquant = TextEditingController();
  List<bool> mode_view = [true, false];
  void initState() {
    this._controlarquant.text = _n.toString();
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
              child: FloatingActionButton(
            child: Text("Scan"),
            onPressed: () {
              _handleShowProductDetail(context);
            },
          )),
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
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
                SizedBox(
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
                    new FloatingActionButton(
                      onPressed: () {
                        if (_separatudo(qr_data!) == 'i') {
                          _n++;
                        } else {
                          _n += 0.1;
                        }
                        controller:
                        _controlarquant.text = _n.toString();
                      },
                      child: new Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(
                      width: 150.0,
                      child: TextField(
                        controller: _controlarquant,
                        decoration: new InputDecoration(
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(color: Colors.white)),
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.white, fontSize: 42.0),
                        textAlign: TextAlign.center,
                        textInputAction: TextInputAction.done,
                        onSubmitted: (ValueKey) {
                          _n = double.parse(_controlarquant.text);
                        },
                      ),
                    ),
                    new FloatingActionButton(
                      onPressed: () {
                        if (_separatudo(qr_data!) == 'i') {
                          _n--;
                        } else {
                          _n -= 0.1;
                        }
                        _controlarquant.text = _n.toString();
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
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: BtnDefault(
                      mode: 'light',
                      func: () async {
                        var res = await this
                            .stock_controller
                            .handleChangeQuantity(_n, qr_data!);

                        Navigator.pop(context);
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
  return resultadolista;
}

String _separanome(String data) {
  final List<String> listalouca = data.split('@');
  String resultadolista = listalouca[1];
  return resultadolista;
}
