import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:stone_box_app/components/utils/image_box.dart';
// import 'package:stone_box_app/components/utils/logo_stoneBox.dart';
// import 'package:stone_box_app/core/controlles/user_controller.dart';
// import 'package:intl/date_symbol_data_local.dart';
import '../components/utils/logo_stoneBox.dart';
import 'package:conter_stock_app/core/controller/user_controller.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  Future? _future;

  @override
  Widget build(BuildContext context) {
    UserController user_controller = Provider.of<UserController>(context);

    if (_future == null) {
      _future = Future(
          () async => await verifyAuthentication(user_controller, context));
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: _future,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Center(
            child:
                LogoStineBox(size: (MediaQuery.of(context).size.width * 0.40)),
            // Column(children: [
            //   const SizedBox(height: 100),
            //   LogoStineBox(size: (MediaQuery.of(context).size.width * 0.40)),
            //   const SizedBox(height: 116),
            //   const SizedBox(height: 16),
            // ]),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(8.0),
        child: const Text(
          'Powered by\nMotora.ai',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Future<void> verifyAuthentication(
      UserController user_controller, context) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    await user_controller.getDataLocal();
    // await media_controller.setCamera();
    final validate = await user_controller.isLogeed();
    if (validate) {
      Navigator.of(context).pushReplacementNamed('/');
    } else {
      Navigator.of(context).pushReplacementNamed('/login');
    }
  }
}
