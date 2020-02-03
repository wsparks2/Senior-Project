
import 'package:flutter/material.dart';
import 'package:test_1/rebuild/rebuild.dart';


class SecondaryView extends StatefulWidget {
  @override
  _SecondaryState createState() => _SecondaryState();
}

class _SecondaryState extends State<SecondaryView> {
  
  @override
  Widget build(BuildContext context) {
    return Rebuild();
  }
}