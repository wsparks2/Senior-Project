import 'package:flutter/material.dart';

class Supplements extends StatelessWidget {
  final Map<String, bool> values;

  Supplements(this.values);

  @override
  Widget build(BuildContext context) {
    return Expanded( // wrap in Expanded
        child: new ListView(
          children: values.keys.map((String key) {
            return new CheckboxListTile(
              title: new Text(key),
              value: values[key],
              onChanged: (bool value) {
                //setState(() {
                //  values[key] = value;
                //});
              },
            );
          }).toList(),
        )
    );
    return null;
  }

}