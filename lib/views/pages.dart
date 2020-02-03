
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

// Views
import 'package:test_1/views/camera.dart';
import 'package:test_1/views/home.dart';
import 'package:test_1/views/oldHome.dart';
import 'package:test_1/views/secondary_view.dart';



class Pages extends StatefulWidget {
  final CameraDescription camera;
  const Pages({
    Key key,
    @required this.camera,
  }): super(key: key);
  
  @override
  _PagesState createState() => _PagesState();
}


class _PagesState extends State<Pages> {
  final PageController _pageController = PageController(initialPage: 1);  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: _pageController,
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          SecondaryView(),
          IngHome('Home'),
          HomeView(),// 0// 1
          TakePictureScreen(camera: widget.camera),      // 2
        ],
      ),
    );
  }
}
