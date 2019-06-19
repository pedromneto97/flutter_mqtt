import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MqttConnectedEvent extends Equatable {
  MqttConnectedEvent([List props = const []]) : super(props);
}

class MqttStarted extends MqttConnectedEvent {
  @override
  String toString() => 'MqttStarted';
}

class Publish extends MqttConnectedEvent {
  @override
  String toString() => 'Publish';
}
