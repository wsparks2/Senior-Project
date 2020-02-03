
// import 'package:flutter/cupertino.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class LabelBuilder {
  String str;
  var json;

  List<Widget> build(var json) {
    assert(json is List);
    List<Widget> arr = new List();
    String str = "";
    int lineno = json[0]['y1'];
    for (var i = 0; i < json.length; i++) {
      if (json[i]['y1'] != lineno) {
        arr.add(Row(
          children: <Widget>[
            Expanded(
              child: Text(
                str,
                style: TextStyle(
                  fontSize: (json[i-1]['height']/5),
                ),
              ),
            ),
          ],
        ));
        str = "";
        lineno = json[i]['y1'];
      }
      str = str+json[i]['desc'];
      if (i != json.length-1)
        for (int j = 0; j < (json[i+1]['x1']-json[i]['x2'])/15; j++) {
          str += ' ';
        }
    }
    return arr;
  }

  Future<List<Widget>> loadAsset(String path) async {
    str = await rootBundle.loadString(path);
    json = await jsonDecode(str);
    assert(json is List);
    return build(json);
  }

}

class Rebuild extends StatefulWidget {
  @override
  _RebuildState createState() => new _RebuildState();
}

class _RebuildState extends State<Rebuild> {
  LabelBuilder label = new LabelBuilder();
  List<Widget> wids = [];
  _RebuildState() {
    label.loadAsset('assets/test.json').then((val) => setState(() {
      wids = val;
    }));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        primary: false,
      ),
      body: Container(
        child: Center(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: wids,
          )
        )
      )
    );
  }

}