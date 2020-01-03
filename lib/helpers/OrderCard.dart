import 'package:flutter/material.dart';

class OrderCard extends StatefulWidget{
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard>{

  @override
  Widget build(BuildContext context){
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.0, vertical: 10.0
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFD3D3D3), width: 2.0),
                borderRadius: BorderRadius.circular(10.0)
              ),
              width: 45.0,
              height: 73.0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                
              ),
            )
          ],
        ),
      ),
    );
  }
}