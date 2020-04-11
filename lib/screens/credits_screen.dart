import 'package:flutter/material.dart';

class CreditsScreen extends StatelessWidget {
  static const routeName = '/credits-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Credits')),
      body: Center(child: Text('hello')),
    );
  }
}