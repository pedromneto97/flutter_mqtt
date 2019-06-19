import 'package:flutter/material.dart';

class MqttPublishForm extends StatefulWidget {
  @override
  _MqttPublishForm createState() => _MqttPublishForm();
}

class _MqttPublishForm extends State<MqttPublishForm> {
  TextEditingController _topicController;
  List<List<TextEditingController>> _pairs =
  new List<List<TextEditingController>>();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  List<Row> items;

  @override
  void initState() {
    super.initState();
    _topicController = TextEditingController();
    _pairs.add([TextEditingController(), TextEditingController()]);
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
        children: buildItems(),
      ),
    );
  }

  List<Widget> buildItems() {
    List<Widget> widgets = [
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
    ];
    _pairs.forEach((list) {
      widgets.add(
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Chave';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: "Chave"),
                controller: list.first,
                keyboardType: TextInputType.text,
              ),
              fit: FlexFit.loose,
            ),
            Flexible(
              child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Valor';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: "Valor"),
                controller: list.last,
                keyboardType: TextInputType.text,
              ),
              fit: FlexFit.loose,
            ),
          ],
        ),
      );
    });
    widgets.add(Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: RaisedButton(
            onPressed: () =>
                this.setState(() =>
                    this
                        ._pairs
                        .add(
                        [TextEditingController(), TextEditingController()])),
            child: Text('Add Pair'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: RaisedButton(
            onPressed: () => _key.currentState.validate() ? _onSubmit() : null,
            child: Text('Submit'),
          ),
        ),
      ],
    ));
    return widgets;
  }
}
