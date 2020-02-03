
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
	@override
	State<StatefulWidget> createState() {
		return _BottomNavState();
	}
}

class _BottomNavState extends State<BottomNav> {

	int _index = 0;

	List<BottomNavigationBarItem> _items = [
		BottomNavigationBarItem(
			icon: Icon(Icons.home),
			title: Text('Home'),
		),
		BottomNavigationBarItem(
			icon: Icon(Icons.business),
			title: Text('Business'),
		),
		BottomNavigationBarItem(
			icon: Icon(Icons.school),
			title: Text('School'),
		),
	];
	
	@override
	Widget build(BuildContext context) {
		return BottomNavigationBar(
			onTap: _tappedIndex,
			currentIndex: _index,
			selectedItemColor: Colors.blueGrey[200],
			// selectedFontSize: 16.0,
			items: _items,
		);
	}

	void _tappedIndex(int value) {
		setState( () {
			_index = value;
		});
	}
}
