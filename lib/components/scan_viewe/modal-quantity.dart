import 'package:conter_stock_app/components/utils/btn_default.dart';
import 'package:conter_stock_app/state/scaner_state.dart';
import 'package:conter_stock_app/theme/styles.dart';
import 'package:flutter/material.dart';

import 'package:conter_stock_app/core/controller/stock_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../home/scaner_viewe.dart';
// import 'package:flushbar/flushbar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class QuantityModal extends StatefulWidget {
  final String? qr_data;
  final StockController stock_controller;

  const QuantityModal(
      {Key? key, required this.qr_data, required this.stock_controller})
      : super(key: key);

  @override
  _QuantityModalState createState() => _QuantityModalState();
}

class _QuantityModalState extends State<QuantityModal> {
  double _n = 1.0;
  TextEditingController _controllerQuant = TextEditingController();
  bool _loading = false;
  Barcode? result;

  void initState() {
    int _n1 = _n.round();
    this._controllerQuant.text = _n1.toString();

    widget.stock_controller.stateNotifier.addListener(() {
      // Seta a variavel de loading como true se a estao do comtroller fpr  igual a loading
      print(widget.stock_controller.state);
      if (widget.stock_controller.state == ScannerState.error) {
        showToats('Algo esta errado', false);
        if (this.mounted) {
          Navigator.pop(context);
        }
        // setState(() {});
      } else if (widget.stock_controller.state == ScannerState.success) {
        showToats('Produto atualizado', true);
        if (this.mounted) {
          Navigator.pop(context);
        }
        // setState(() {});
      } else if (widget.stock_controller.state == ScannerState.loading) {
        this._loading = true;
      }
      if (this.mounted) {
        setState(() {});
      }

      //setState(() {});
    });
  }

  void dispose() {
    print('morreuuuuuuuuuuuuuuuuuuuu');
    widget.stock_controller.stateNotifier.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            //qr_data ?? '',
            separanome(widget.qr_data!),
            textAlign: TextAlign.left,
            style: const TextStyle(color: Colors.white, fontSize: 22),
          ),
        ),
        const SizedBox(
          width: 200.0,
          height: 50.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              onPressed: () {
                handleCount(1);
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
                controller: _controllerQuant,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(color: Colors.white)),
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.white, fontSize: 42.0),
                textAlign: TextAlign.center,
                textInputAction: TextInputAction.done,
                onSubmitted: (ValueKey) {
                  _n = double.parse(_controllerQuant.text);
                },
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                handleCount(-1);
              },
              child: const Icon(Icons.remove, color: Colors.black),
              backgroundColor: Colors.white,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            separatudo(widget.qr_data!),
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 22),
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: BtnDefault(
              is_loading: _loading =
                  widget.stock_controller.state == ScannerState.loading,
              mode: 'light',
              func: () {
                handleSubmit(context);
              },
              label: 'Atualizar',
            )),
      ],
    );
  }

  handleSubmit(BuildContext context) {
    // setState(() {
    //   this._loading = true;
    // });
    widget.stock_controller.handleChangeQuantity(_n, widget.qr_data!);

    // Navigator.pop(context);
    // setState(() {
    //   this._loading = false;
    // });
  }

  handleCount(int sinal) {
    if (this.separatudo(widget.qr_data!) == 'Metro(s)') {
      _n += 0.1 * sinal;
    } else {
      _n += sinal;
    }
    _controllerQuant.text =
        _handleShowTextScreen(_n, widget.qr_data!); //_n.toString();
  }

  String separanome(String data) {
    final List<String> listalouca = data.split('@');
    String resultadolista = listalouca[1];
    return resultadolista;
  }

  String _handleShowTextScreen(double numerote, String data) {
    String nemo = '';
    int numero;

    if (separatudo(data) == 'Metro(s)') {
      nemo = numerote.toStringAsFixed(2);
    } else {
      numero = numerote.round();
      nemo = numero.toString();
    }
    return nemo;
  }

  String separatudo(String data) {
    final List<String> listalouca = data.split('@');
    String resultadolista = listalouca[2];
    if (resultadolista == 'r') {
      resultadolista = 'Metro(s)';
    } else {
      resultadolista = 'Unidade(s)';
    }
    return resultadolista;
  }

  void showPopUp(context, String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
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
  }

  void showToats(String text, bool success) {
    Fluttertoast.showToast(
      msg: text,
      gravity: ToastGravity.SNACKBAR,
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 3,
      backgroundColor: success ? Colors.green : Colors.red,
      textColor: Colors.white,
      // fontSize: 14.0
    );
  }

  // void showSimpleFlushbar(context, String mensagem) {
  //   Flushbar(
  //     message: mensagem,
  //     duration: Duration(seconds: 30),
  //     leftBarIndicatorColor: Colors.blue.shade300,
  //     backgroundColor: Colors.red.shade300,
  //   )..show(context);
  // }
}
