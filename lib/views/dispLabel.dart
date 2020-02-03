import 'package:flutter/material.dart';
import './labelRender.dart';
import './ingRender.dart';

class DispRoute extends StatelessWidget {
  final List ing;
  final List min;
  @override
  DispRoute({Key key, @required this.ing, @required this.min}) : super(key: key);
  //void process(argu) {}
  //for (String word in argu) {}




  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text('Nutrition Facts', style: const TextStyle(color: Colors.white))),
        body: Container (child : Column(
        children: [
          LabelRoute(ing: ing, min: min),
          IngRoute(ing: ing, min: min)
        ]

    )
        )

  );
  }

}