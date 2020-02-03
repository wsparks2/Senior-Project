
import 'package:flutter/material.dart';
import 'package:test_1/views/sandbox/drawer.dart';
// import 'package:test_1/camera.dart';
import 'package:test_1/views/sandbox/top_bar.dart';
// import 'package:test_1/page_route._test.dart';

class HomePage extends StatefulWidget {

  HomePage({Key key}) : super(key : key);

  final String title = 'Home';
  
	@override
	_HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(title: widget.title),
      drawer: DrawerNav(),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(25.0),
            child: Image.asset('assets/food.jpg'),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.black,
                ),
              ),
              color: Colors.grey[300],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    print('NOTHING YET!!!');
                  },
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.camera,
                        size: 50,  
                      ),
                      Text('Scan New Label'),
                    ],
                  )
                ),
                
                InkWell(
                  onTap: () {
                    print('NOTHING YET!!!');
                  },
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.history,
                        size: 50,  
                      ),
                      Text('View History'),
                    ],
                  )
                ),
              ],
            ),
          ),

        ],
      )
    );
  }
}

// Route _createRoute() {
//   return PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) => Welcome(),
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       Offset begin = Offset(1.0, 0.0);
//       Offset end = Offset.zero;
//       var curve = Curves.elasticOut;
//       var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve) );
//       var offsetAnimation = animation.drive(tween);
//       return SlideTransition(
//         position: offsetAnimation,
//         child: child,
//       );
//       // return child;
//     },
//   );
// }