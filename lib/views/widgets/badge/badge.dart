import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class badge extends StatefulWidget {
  @override
  _badgeState createState() => _badgeState();
}

class _badgeState extends State<badge> {
  int _counter = 0;
  bool showElevatedButtonBadge = true;

  @override
  Widget build(BuildContext context) {
    return expandedBadge();
  }

  Widget expandedBadge() {
    return Container(
      child: Badge(
        badgeColor: Colors.yellow,
        badgeContent: Text('10'),
        child: Icon(Icons.notifications, size: 30,color: Colors.white,),
      ),
    );
  }
}
