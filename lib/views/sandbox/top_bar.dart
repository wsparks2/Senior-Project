
import 'package:flutter/material.dart';

class TopBar extends StatefulWidget with PreferredSizeWidget {

  TopBar({this.title});

  final String title;
  
	@override
	State<StatefulWidget> createState() {
		return _TopBarState();
	}

  @override
  Size get preferredSize => Size.fromHeight(56);  
}

class _TopBarState extends State<TopBar> {
	@override
	Widget build(BuildContext context) {
		return AppBar(
			// title: Text(widget.title),
      title: Text(widget.title),
			centerTitle: true,
			leading: Builder(
				builder: (BuildContext context) {
					return IconButton(
						icon: const Icon(Icons.menu),
						onPressed: () { Scaffold.of(context).openDrawer(); },
						tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
					);
				},
			),
		);
	}
}