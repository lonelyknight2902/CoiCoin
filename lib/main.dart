import 'package:flutter/material.dart';
import './home.dart';
import './account.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      theme: ThemeData.dark(),
    );
  }
}
