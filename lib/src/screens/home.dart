import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter HOokS!'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
        child: Text(
          'Hello, Omar!',
          style: TextStyle(fontSize: 25),
        ),
      )),
    );
  }
}
