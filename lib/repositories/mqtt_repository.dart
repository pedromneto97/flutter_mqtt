import 'dart:async';

import 'package:mqtt_client/mqtt_client.dart';

class MQTTRepository {
  Future<MqttClient> connect(String host, int port,
      {String username = '', String password = ''}) async {
    final MqttClient client = MqttClient(host, 'Flutter');
    client.logging(on: false);
    client.keepAlivePeriod = 60;
    client.port = port;
    try {
      if (username.isNotEmpty && password.isNotEmpty) {
        await client.connect(username, password);
      } else
        await client.connect();
    } catch (e) {
      print("Erro ao conectar o MQTT: ${e.toString()}");
      client.disconnect();
      return null;
    }
    return client;
  }
}

final mqtt_repository = MQTTRepository();
