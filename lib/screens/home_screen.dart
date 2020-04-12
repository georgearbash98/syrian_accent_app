import 'package:flutter/material.dart';
import '../widgets/home_screen_item.dart';
import '../Data.dart';
import './credits_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Guessing game') , actions: <Widget>[
        IconButton(
          icon: Icon(Icons.error_outline),
          onPressed: () {
            Navigator.of(context).pushNamed(CreditsScreen.routeName);
          },
        )
      ],),
      body: GridView(
        padding: const EdgeInsets.all(15),
        children: GOVERNORATES
            .map((gov) => HomeScreenItem(gov,'assets/images/Damascus.png'))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}