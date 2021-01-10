import 'package:flutter/material.dart';
import 'di/depedency_injection.dart';
import 'pages/index.dart';
import 'themes/color.dart';

void main() {
  Injector.configure(Flavor.PROD);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: primary),
    home: IndexPage(),
  ));
}
