import 'package:flutter/material.dart';

import 'bloc.dart';

class MqttConnectForm extends StatefulWidget {
  final MqttBloc mqttBloc;

  MqttConnectForm(this.mqttBloc);

  @override
  _MqttConnectFormState createState() => _MqttConnectFormState();
}

class _MqttConnectFormState extends State<MqttConnectForm> {
  TextEditingController _hostController;
  TextEditingController _portController;
  TextEditingController _usernameController;
  TextEditingController _passwordController;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _hostController = TextEditingController();
    _portController = TextEditingController(text: "1883");
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _hostController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    widget.mqttBloc.dispatch(ConnectMqtt(
      _hostController.text,
      int.parse(_portController.text),
      _usernameController.text,
      _passwordController.text,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
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
            controller: _hostController,
            keyboardType: TextInputType.url,
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
            controller: _portController,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Username"),
            controller: _usernameController,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Password"),
            obscureText: true,
            controller: _passwordController,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () =>
                  _key.currentState.validate() ? _onSubmit() : null,
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
