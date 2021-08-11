import 'package:flutter/material.dart';
import 'package:news/themes.dart';
import 'package:news/views/home.dart';

//ecbe225f77e74bd6adb5ee03ae3868e6
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peadme.io',
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      home: Home(),
    );
  }
}
