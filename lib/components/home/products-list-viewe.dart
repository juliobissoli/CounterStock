import 'package:conter_stock_app/components/home/scaner_viewe.dart';
import 'package:flutter/material.dart';
import '../../core/controller/stock_controller.dart';

class ProductListViewe extends StatefulWidget {
  const ProductListViewe({Key? key}) : super(key: key);

  @override
  _ProductListVieweState createState() => _ProductListVieweState();
}

class _ProductListVieweState extends State<ProductListViewe> {
  String frase = 'Vá devagar porque isso é apenas um tira';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: const Center(
          child: Text(
            "Aguarde nessa tela 3s\n para carregar a câmera\nObrigado pela atenção",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              color: Colors.black,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            popdamorte('Testando', context);
            // Add your onPressed code here!
          },
          backgroundColor: Colors.green,
          child: const Icon(Icons.dehaze),
        ));
  }
}
