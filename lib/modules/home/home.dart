import 'package:flutter/material.dart';
import 'package:flutter_mqtt/modules/scaffold/scaffold.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/minerva_white.png')
          ],
        ),
      ),
    );
  }
}
