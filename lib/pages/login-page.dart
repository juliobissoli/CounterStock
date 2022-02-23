import 'package:conter_stock_app/core/controller/user_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:stone_box_app/components/utils/logo_stoneBox.dart';
import '../components/utils/logo_stoneBox.dart';
import '../components/utils/popup_alert.dart';
import '../components/utils/btn_default.dart';
import '../components/utils/circular_indicator_default.dart';
import '../components/utils/image_box.dart';
import '../components/utils/input_primary.dart';
import '../theme/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  var user_controller = new UserController();

  var controller_email = new TextEditingController();
  var controller_pass = new TextEditingController();

  var loggin_succes;
  var loading;

  String mensage_error = "Login invalido!";

  @override
  void initState() {
    // TODO: implement initState
    loggin_succes = true;
    loading = false;
    super.initState();
  }

  void dispose() {
    controller_email.dispose();
    controller_pass.dispose();
    super.dispose();
  }

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<bool> _checado;
  late Future<String> _nometo;

  Future<void> _increment() async {
    final SharedPreferences prefs = await _prefs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: Column(children: [
                const SizedBox(height: 100),
                LogoStineBox(size: (MediaQuery.of(context).size.width * 0.40)),
                const SizedBox(height: 116),
                const SizedBox(height: 16),
                InputPrimary(
                  label: "Nome",
                  type_input: TextInputType.emailAddress,
                  capitalization: TextCapitalization.none,
                  controller_input: controller_email,
                ),
                const SizedBox(height: 20),
                InputPrimary(
                  label: "Senha",
                  type: 'password',
                  capitalization: TextCapitalization.none,
                  type_input: TextInputType.visiblePassword,
                  controller_input: controller_pass,
                ),
                const SizedBox(height: 16),
                !loading
                    ? BtnDefault(
                        label: 'Entrar', func: _handleLogin, mode: "dark")
                    : CircularIndicatorDefault(),
                const SizedBox(height: 16),
                loggin_succes ? Container() : AlertDanger(text: mensage_error)
              ]),
            ),
          ),
        ),
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

  @override
  Future _handleLogin() async {
    var email = controller_email.text;
    var pass = controller_pass.text;

    handleLoading(true);
    var verify_auth = await user_controller.login(email, pass);
    if (verify_auth) {
      handleLoading(true);
      Navigator.of(context).pushReplacementNamed('/');
    } else {
      handleLoading(false);
      this.mensage_error = 'Erro na autenticação';
      _showAlert();
    }
    print(email);
    // if (pass == "Motora8989") {
    //   handleLoading(true);
    //   Navigator.of(context).pushReplacementNamed('/');
    // } else {
    //   handleLoading(false);
    //   _showAlert();
    // }
  }

  Future _showAlert() {
    setState(() {
      this.loggin_succes = false;
    });
    return new Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        this.loggin_succes = true;
      });
    });
  }

  void handleLoading(bool show) {
    setState(() {
      this.loading = show;
    });
  }
}
