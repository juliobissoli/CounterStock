import 'package:flutter/material.dart';

import '../components/home/products-list-viewe.dart';
import '../components/home/scaner-viewe.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override

  final PageController controller = PageController();


  Widget build(BuildContext context) {
    return Scaffold(
      body:  PageView(
         controller: controller,
         children: [
           ScanerViewe(),
           ProductListViewe(),
         ],
      )
    );
  }
}