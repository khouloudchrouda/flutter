import 'dart:io';

import 'package:flutter/material.dart';
import 'package:prianou_app/login.dart';
import 'package:prianou_app/main_layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var isLoggedIn = true;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: isLoggedIn ? MainLayoutPage() : Login(),
    );
  }
}
