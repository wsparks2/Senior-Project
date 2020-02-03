import 'package:flutter/material.dart';
import './ingredientData.dart';

List<ActionChip> getChips = [];

class IngRoute extends StatelessWidget {
  final List ing;
  final List min;
  @override
  IngRoute({Key key, @required this.ing, @required this.min}) : super(key: key);
  void process(argu) {}
    //for (String word in argu) {}
    List<Widget> fillChips(context){
      for (var i = 0; i < ing.length; i++) {
        getChips.add(ActionChip(
          /* avatar: CircleAvatar(
                backgroundColor: Colors.grey.shade800,
                child: Text('AB'),
              ),*/
          label: Text('${ing[i]}'),
          onPressed: () {
            var myText = "${ing[i]}";
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondRoute(text: myText))
            );
          },
        ));

      }
      return getChips;
    }


  Widget build(BuildContext context) {
    return Container(
        height: 150.0,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(8.0),
    child: SingleChildScrollView(
        child:Wrap(
            children:  fillChips(context)
    )
    )
    );
  }

}