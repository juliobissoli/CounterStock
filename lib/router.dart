import 'package:flutter/material.dart';
import './pages/home-pages.dart';
import './pages/login-page.dart';


Map<String, WidgetBuilder> appRoutes() => <String, WidgetBuilder>{
  // '/': (BuildContext context) => IndexPage(),
  '/': (BuildContext context) => HomePage(),
  '/login': (BuildContext context) => LoginPage(),
  // '/settings': (BuildContext context) => UserSettingsPage(),
  // '/new_stone': (BuildContext context) => NewStonePage(),
  // '/exception': (BuildContext context) => ExceptionPage(),
  // '/camera': (BuildContext context) => CameraViewPage()
};