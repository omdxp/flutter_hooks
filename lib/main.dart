import 'package:flutter/material.dart';
import 'package:flutter_hooks_app/src/screens/home.dart';

void main() => runApp(FlutterHooksApp());

class FlutterHooksApp extends StatelessWidget {
  const FlutterHooksApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Home(),
    );
  }
}
