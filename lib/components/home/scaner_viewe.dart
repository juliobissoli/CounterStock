import 'package:flutter/material.dart';
import '../utils/btn_default.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../utils/modal.dart';

class ScanerViewe extends StatefulWidget {
  const ScanerViewe({Key? key}) : super(key: key);

  @override
  _ScanerVieweState createState() => _ScanerVieweState();
}

class _ScanerVieweState extends State<ScanerViewe> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  double _n = 0.0;
  final _controlarquant = TextEditingController();

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

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
    ));
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
            show_top: true,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    new FloatingActionButton(
                      onPressed: () {
                        _n++;
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
                        decoration: new InputDecoration(
                            labelText: "$_n",
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(color: Colors.white)),
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    new FloatingActionButton(
                      onPressed: () {
                        _n--;
                      },
                      child: new Icon(Icons.remove, color: Colors.black),
                      backgroundColor: Colors.white,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    child: const Text('Atualizar'),
                    onPressed: () {},
                  ),
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
      _handleShowProductDetail(context);
      setState(() {
        result = scanData;
      });
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
