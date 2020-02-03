import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class LabelRoute extends StatelessWidget {
  final List ing;
  final List min;
  @override
  LabelRoute({Key key, @required this.ing, @required this.min}) : super(key: key);
  void process(argu) {
  for (String word in argu) {

  }
  }


  Widget build(BuildContext context) {
    return Container( height: 150, child: ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: min.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          color: Colors.amber,
          child: Center(child: Text('${min[index]}')),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    )
    );
  }

}

