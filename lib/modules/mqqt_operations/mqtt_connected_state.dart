import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MqttConnectedState extends Equatable {
  MqttConnectedState([List props = const []]) : super(props);
}

class InitialMqttConnectedState extends MqttConnectedState {
  @override
  String toString() => 'InitialMqttConnectedState';
}

class PublishInfoState extends MqttConnectedState {
  @override
  String toString() => 'PublishState';
}
