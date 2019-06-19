import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mqtt_client/mqtt_client.dart';

@immutable
abstract class MqttState extends Equatable {
  MqttState([List props = const []]) : super(props);
}

class InitialMqttState extends MqttState {
  @override
  String toString() => 'Initial';
}

class ConfigureMqttState extends MqttState {
  @override
  String toString() => 'ConfigureMqttState';
}

class ConnectingMqttState extends MqttState {
  @override
  String toString() => 'ConnectingMqttState';
}

class ConnectedMqttState extends MqttState {
  final MqttClient client;

  ConnectedMqttState(this.client);

  @override
  String toString() => 'ConnectedMqttState';
}
