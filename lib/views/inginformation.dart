import 'package:flutter/material.dart';

// search from database widget class

List<String> list = new List<String>();
List<Widget> searchWidget(list){
  String a = list.toString();
  a.substring(0, a.length-2);
  list = a;
  Text("$a", textAlign: TextAlign.center, style: TextStyle(fontSize: 30),
  );
  //if found - print result
  //else - print no result
  return list;
}

class IngInformation extends StatefulWidget {
  final String name;
  IngInformation({Key key, this.name}) : super (key: key); // extra parameter
  @override
  _IngInformationState createState() => _IngInformationState();
}

class _IngInformationState extends State<IngInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
      new RaisedButton(onPressed: null,
          child: new Text('SAVE', style: TextStyle(fontSize: 25)), disabledColor: Colors.orange[700],
      ),
      appBar: AppBar(
        title: Text("${widget.name}",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 30
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
            Text('No result', style: TextStyle(fontSize: 25, color: Colors.red),)
          ],
        ),

      ),
    );
  }
}
