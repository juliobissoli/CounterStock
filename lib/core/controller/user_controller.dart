import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum FetchingState { Loading, Success, Error, Empty }

class UserController with ChangeNotifier {
  // StoneBoxApi get api => StoneBoxApi.singleton;

  bool is_logged = false;
  String username = "";
  String email = "";
  String token = '';
  int user_id = -1;
  int company_id = -1;
  int contracted_product = 0;

  Response<dynamic>? error_login;

  FetchingState _fetchingState = FetchingState.Empty;

  FetchingState get fetchingState => _fetchingState;

  void setFetchingState(FetchingState fetchingState) {
    _fetchingState = fetchingState;
    notifyListeners();
  }

  Future getDataLocal() async {
    setFetchingState(FetchingState.Loading);

    final data_local = await SharedPreferences.getInstance();

    is_logged = data_local.getBool("@is_logged") ?? false;
    username = data_local.getString("@username") ?? "";
    // user_id = data_local.getInt("@user_id") ?? -1;
    // email = data_local.getString("@email") ?? "";
    // token = data_local.getString("@token") ?? "";
    // company_id = data_local.getInt("@company_id") ?? 0;
    // contracted_product = data_local.getInt("@contracted_product") ?? 0;

    // api.setAuthToken(token);

    setFetchingState(FetchingState.Success);
  }

  Future cleanDataLocal() async {
    final data_local = await SharedPreferences.getInstance();
    data_local.setBool("@is_logged", false);
    data_local.setString("@username", "");
    // data_local.setString("@email", "");
    // data_local.setString("@token", "");
    // data_local.setInt("@company_id", -1);
    // data_local.setInt("@contracted_product", 0);
  }

  Future login(String user, String password) async {
    if (password == 'Motora8989') {
      this.setLocalState(true, user);
      return true;
    }

    // try {
    //   final res = await api.loginApi(email: email, password: password);
    //   if (res.statusCode == 200) {
    //     final session = res.data['session'];
    //     final user = res.data['user'];
    //     final company = res.data['company'];
    //     api.setAuthToken(session['token']);
    //     // this.setLocalState(true, user['username'], user['id'] ,user['email'], session['token'], user['company_id']);
    //     this.setLocalState(true, user);
    //     print("Login success");

    //     return true;
    //   } else {
    //     this.error_login = res;
    //     print("Erro no login");
    //     return false;
    //   }
    // } on DioError catch (e) {
    //   print('Deu erro ${e.response}');
    //   this.error_login = e.response;
    //   print("Erro => $e");
    //   return false;
    // }
  }

  // setLocalState(bool is_logged, String username, int user_id, String email, String token, int company_id) async {
  setLocalState(bool is_logged, String user) async {
    final data_local = await SharedPreferences.getInstance();

    data_local.setBool("@is_logged", is_logged);
    // data_local.setString("@token", token);
    data_local.setString("@username", user);
    // data_local.setInt("@user_id", user['id']);
    // data_local.setInt("@company_id", user['company_id']);
    // data_local.setString("@email", user['email']);
    // data_local.setInt(
    //     "@contracted_product", int.parse(company['contracted_product']));
    // api_get
  }

  void logout() async {
    await this.cleanDataLocal();
    await this.getDataLocal();
  }

  // String getNameWelcome() {
  //   if (username == "")
  //     return "";
  //   else {
  //     var str_split = username.split(" ");
  //     var last_leter =
  //         str_split.length > 1 ? str_split[str_split.length - 1] : null;

  //     return "${str_split[0]} " +
  //         (last_leter != null ? last_leter[0] + '.' : '');
  //   }
  // }

  Future<bool> isLogeed() async {
    final data_local = await SharedPreferences.getInstance();

    is_logged = data_local.getBool("@is_logged") ?? false;
    user_id = data_local.getInt("@user_id") ?? -1;
    // token = data_local.getString("@token") ?? "";
    // company_id = data_local.getInt("@company_id") ?? -1;

    // if (is_logged) {
    //   print("Validate Company");
    //   final company_validate = await this.validateCompany();
    //   print("Validate Company result => ${company_validate}");

    //   if (!company_validate) {
    //     this.logout();
    //     return false;
    //   }
    //   return true;
    // }
    return is_logged;
  }

  validateCompany() async {
    try {
      // final data_local = await SharedPreferences.getInstance();
      // company_id = data_local.getInt("@company_id") ?? -1;
      // final res = await api.api_get('company/$company_id', null);
      // if (res.statusCode == 200) {
      //   if (res.data['status'] == 'approved') {
      //     return true;
      //   }
      //   return false;
      // } else
      //   return true;
    } catch (e) {
      print("Não acho api");
      return true;
    }
  }

  jsonDecode(String body) {}
}
