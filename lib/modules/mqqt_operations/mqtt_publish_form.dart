import 'package:flutter/material.dart';

class MqttPublishForm extends StatefulWidget {
  @override
  _MqttPublishForm createState() => _MqttPublishForm();
}

class _MqttPublishForm extends State<MqttPublishForm> {
  TextEditingController _topicController;
  List<List<TextEditingController>> _pairs;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _topicController = TextEditingController();
  }

  @override
  void dispose() {
    _topicController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    print("Ok");
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Tópico do MQTT';
                }
                return null;
              },
              decoration: InputDecoration(labelText: "Tópico"),
              controller: _topicController,
              keyboardType: TextInputType.text,
            ),
            fit: FlexFit.loose,
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
