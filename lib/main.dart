import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import './core/controller/stock_controller.dart';

import './router.dart';
import './theme/styles.dart';
import 'dart:developer';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<StockController>(
          create: (_) => StockController(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'CouterStock',
          routes: appRoutes(),
          theme: appTheme(),
          initialRoute: '/index'),
    );
  }
}
