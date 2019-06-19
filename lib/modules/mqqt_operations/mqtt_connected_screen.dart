import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';
import 'mqtt_publish_form.dart';

class MqttConnectedScreen extends StatefulWidget {
  @override
  _MqttConnectedScreenState createState() => _MqttConnectedScreenState();
}

class _MqttConnectedScreenState extends State<MqttConnectedScreen> {
  MqttConnectedBloc _connectedBloc;

  @override
  void initState() {
    super.initState();
    _connectedBloc = MqttConnectedBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () => _connectedBloc.dispatch(Publish()),
              child: Text("Publish"),
            ),
            RaisedButton(
              child: Text("Subscribe"),
              onPressed: () {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.error_outline),
                        Text("Não implementado")
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
        BlocBuilder(
            bloc: _connectedBloc,
            builder: (context, MqttConnectedState state) {
              if (state is InitialMqttConnectedState) {
                return Container();
              }
              if (state is PublishInfoState) {
                return MqttPublishForm();
              }
            })
      ],
    );
  }
}
