import 'package:flutter/material.dart';

class Test123 extends StatefulWidget {
  static String routeNameTest = "/splashtest";
  @override
  _Test123State createState() => _Test123State();
}

class _Test123State extends State<Test123> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 100,
          width: 100,
          color: Colors.red,
        ),
      )
    );
  }
}
