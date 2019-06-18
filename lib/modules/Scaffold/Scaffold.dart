import 'package:flutter/material.dart';

class MyScaffold extends StatefulWidget {
  final Widget child;

  MyScaffold(this.child);

  @override
  _MyScaffoldState createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter MQTT"),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: null,
          tooltip: "Navigation menu",
        ),
      ),
      body: widget.child,
    );
  }
}
