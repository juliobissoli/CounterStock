// import 'package:conter_stock_app/components/scan_viewe/quantity_modal.dart';
import 'package:conter_stock_app/components/scan_viewe/modal-quantity.dart';
import 'package:conter_stock_app/state/scaner_state.dart';
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
            child: FloatingActionButton(
              child: const Text("Scan"),
              onPressed: () {
                qr_data = 'IND000065000@RaspBarry Pi 3 Model B@i';
                _handleShowProductDetail(context);
                stock_controller.getQuantity(separacodigo(qr_data));
              },
            ),
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
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext builder) {
        return Modal(
            size_height: 420.0,
            show_top: false,
            child: QuantityModal(
                qr_data: qr_data, stock_controller: this.stock_controller));
      },
    );
  }

  String separacodigo(String? data) {
    if (data != null) {
      final List<String> listalouca = data.split('@');
      String resultadolista = listalouca[0];
      return resultadolista;
    } else {
      return '';
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    final state = stock_controller.state;
    controller.scannedDataStream.listen((scanData) {
      if (state != ScannerState.inputting ||
          state == ScannerState.loading ||
          state == ScannerState.quantityChecked ||
          state == ScannerState.quantityChecking ||
          state == ScannerState.quantityNotFound) {
        stock_controller.state = ScannerState.inputting;
        stock_controller.getQuantity(separacodigo(scanData.code));
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
