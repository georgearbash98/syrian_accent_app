import 'package:flutter/material.dart';
import '../screens/quiz_screen.dart';

class HomeScreenItem extends StatelessWidget {
  final String title;
  final String imgUrl;

  HomeScreenItem(this.title, this.imgUrl);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(QuizScreen.routeName, arguments: {
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Container(
            width: 30,
            color: Colors.white38,
            child: Text(title),
          ),
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imgUrl),
            fit: BoxFit.cover,
          ),
          gradient: LinearGradient(
            colors: [Colors.white10, Colors.black54],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
