import 'package:flutter/material.dart';
import '../models/Accent.dart';
import '../screens/quiz_screen.dart';

class HomeScreenItem extends StatelessWidget {
  final Accent accent;

  HomeScreenItem(this.accent);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(QuizScreen.routeName, arguments: {
      'title': accent.title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Colors.black,
      borderRadius: BorderRadius.circular(15),
      child: Stack(children: <Widget>[
        Container(
          decoration: BoxDecoration(
           // color: Colors.transparent,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(accent.imgUrl),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          height: 350.0,
        ),
        Container(
          height: 350.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              //color: Colors.white,
              gradient: LinearGradient(
                  begin: FractionalOffset.topRight,
                  end: FractionalOffset.bottomLeft,
                  colors: [
                    Colors.white10,
                    Colors.white24,
                  ],
                  stops: [
                    0.0,
                    1.0
                  ])),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.circular(15),
            ),
            width: double.infinity,
            child: Text(
              accent.title,
              style: TextStyle(color: Colors.white, fontSize: 20,),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ]),
    );
  }
}
