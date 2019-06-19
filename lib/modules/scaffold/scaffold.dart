import 'package:flutter/material.dart';
import 'package:flutter_mqtt/modules/home/home.dart';
import 'package:flutter_mqtt/modules/mqtt/mqtt_screen.dart';
import 'package:flutter_mqtt/modules/sobre/sobre.dart';

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
      ),
      body: widget.child,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(child: Image.asset('images/logo_blue.png')),
            ListTile(
              trailing: Icon(Icons.home),
              title: Text("Home"),
              onTap: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ),
                    (_) => false,
                  ),
            ),
            ListTile(
              trailing: Icon(Icons.arrow_forward),
              title: Text("MQTT"),
              onTap: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => MQTT(),
                ),
                    (_) => false,
              ),
            ),
            ListTile(
              trailing: Icon(Icons.arrow_forward),
              title: Text("Sobre"),
              onTap: () =>
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Sobre(),
                    ),
                        (_) => false,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
