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

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  // var user_controller = new UserController();

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
                SizedBox(height: 100),
                LogoStineBox(size: (MediaQuery.of(context).size.width * 0.40)),
                SizedBox(height: 116),
                SizedBox(height: 16),
                InputPrimary(
                  label: "Nome",
                  type_input: TextInputType.emailAddress,
                  capitalization: TextCapitalization.none,
                  controller_input: controller_email,
                ),
                SizedBox(height: 20),
                InputPrimary(
                  label: "Senha",
                  type: 'password',
                  capitalization: TextCapitalization.none,
                  type_input: TextInputType.visiblePassword,
                  controller_input: controller_pass,
                ),
                SizedBox(height: 16),
                !loading
                    ? new BtnDefault(
                        label: 'Entrar', func: _handleLogin, mode: "dark")
                    : CircularIndicatorDefault(),
                SizedBox(height: 16),
                loggin_succes ? Container() : AlertDanger(text: mensage_error)
              ]),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(8.0),
        child: Text(
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

    // handleLoading(true);
    // var verify_auth = // await user_controller.login(email, pass);
    // if (verify_auth) {
    //   handleLoading(true);
    //   Navigator.of(context).pushReplacementNamed('/');
    // }
    // else {
    //   handleLoading(false);
    //   this.mensage_error = user_controller.error_login.data['message'].toString();
    //   _showAlert();
    // }
    print(email);
    if (pass == "Motora8989") {
      handleLoading(true);
      Navigator.of(context).pushReplacementNamed('/');
    } else {
      handleLoading(false);
      _showAlert();
    }
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
