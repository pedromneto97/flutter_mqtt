import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MqttEvent extends Equatable {
  MqttEvent([List props = const []]) : super(props);
}

class MqttStarted extends MqttEvent {
  @override
  String toString() => 'MqttStarted';
}

class ConnectMqtt extends MqttEvent {
  final String host;
  final int port;
  final String username;
  final String password;

  ConnectMqtt(this.host, this.port, this.username, this.password);

  @override
  String toString() => 'ConnectMqtt';
}

class MqttConnected extends MqttEvent {
  @override
  String toString() => 'ConnectMqtt';
}

class MqttDisconnected extends MqttEvent {
  @override
  String toString() => 'DisconnectMqtt';
}
