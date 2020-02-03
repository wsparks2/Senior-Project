
import 'package:flutter/material.dart';

import 'old_home.dart';

class DrawerNav extends StatelessWidget {

  static ListTile _logo = ListTile(
    leading: Icon(
      Icons.local_pharmacy,
      size: 50,
      color: Colors.white,
    ),
    title: Text(
      'App_Logo',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.white,
      ),
    ),
    subtitle: whiteText('for senior proj.'),
  );

  static Text whiteText(String str) {
    return Text(
      str,
      style: TextStyle(color: Colors.white),
    );
  }

  static Icon whiteIcon(IconData icon) {
    return Icon(
      icon,
      color: Colors.white,
    );
  }

  List<Widget> _items(BuildContext context) {
    return <Widget>[
      DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.blueGrey,
        ),
        child: _logo,        
      ),
      ListTile(
        title: Text('Home'),
        leading: Icon(Icons.home),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.of(context).pop(context);
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage() ) );
        },
      ),
      ListTile(
        title: Text('Camera'),
        leading: Icon(Icons.camera),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
      ListTile(
        title: Text('History'),
        leading: Icon(Icons.history),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    ];
  }
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Drawer(
        child: Container(
          color: Colors.blueGrey,
          // color: Theme.of(context).primaryColor,
          child: ListView(
            children: _items(context),
          )
        )
      )
    );
  }
}

// class _DrawerNavState extends State<DrawerNav> {

// List<Widget> _items = [
//   ListTile(
//     title: Text('One'),
//     trailing: Icon(Icons.arrow_upward),
//   ),
//   ListTile(
//     title: Text('Two'),
//     trailing: Icon(Icons.arrow_downward),
//   ),
// ];
  
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         children: _items,
//       ),
//     );
//   }
// }