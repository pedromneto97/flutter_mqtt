import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mqtt/modules/scaffold/scaffold.dart';

import 'bloc.dart';

class MQTT extends StatefulWidget {
  @override
  _MQTTState createState() => _MQTTState();
}

class _MQTTState extends State<MQTT> {
  MqttBloc _bloc;
  final _form_key = GlobalKey<FormState>();

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
                    return buildForm();
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

  Widget buildForm() {
    return Form(
      key: _form_key,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Host do MQTT Broker';
              }
              return null;
            },
            decoration: InputDecoration(labelText: "Host"),
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                value = "1883";
              }
              return null;
            },
            decoration: InputDecoration(labelText: "Port"),
            keyboardType: TextInputType.number,
            initialValue: "1883",
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Username"),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Password"),
            obscureText: true,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                _form_key.currentState.validate();
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
