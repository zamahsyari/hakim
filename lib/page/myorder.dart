import 'package:flutter/material.dart';
import 'package:probation/helpers/OrderCard.dart';

class Myorder extends StatefulWidget {
  @override
  _MyorderState createState() => _MyorderState();
}

class _MyorderState extends State<Myorder> {
  @override
  Widget build(BuildContext context) {
    return Container(
          width:300.0,
          height: 100.0,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            scrollDirection: Axis.vertical,
            children: <Widget>[
          OrderCard(),
          OrderCard(),
        ],
          ),
      );
  }
}
