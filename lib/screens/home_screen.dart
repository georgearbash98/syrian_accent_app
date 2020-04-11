import 'package:flutter/material.dart';
import '../widgets/home_screen_item.dart';
import '../Data.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('my meal!')),
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