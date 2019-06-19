import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mqtt/modules/scaffold/scaffold.dart';

import 'bloc.dart';
import 'mqtt_connect_form.dart';

class MQTT extends StatefulWidget {
  @override
  _MQTTState createState() => _MQTTState();
}

class _MQTTState extends State<MQTT> {
  MqttBloc _bloc;

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      Center(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: BlocBuilder(
                bloc: _bloc,
                builder: (context, MqttState state) {
                  if (state is InitialMqttState) {
                    return CircularProgressIndicator();
                  }
                  if (state is ConfigureMqttState) {
                    return MqttConnectForm(_bloc);
                  }
                  if (state is ConnectingMqttState) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Tentando conectar ao servidor de MQTT!"),
                        Divider(height: 20),
                        CircularProgressIndicator()
                      ],
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _bloc = MqttBloc();
    _bloc.dispatch(MqttStarted());
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
