import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_mqtt/repositories/mqtt_repository.dart';

import './bloc.dart';

class MqttBloc extends Bloc<MqttEvent, MqttState> {
  @override
  MqttState get initialState => InitialMqttState();

  @override
  Stream<MqttState> mapEventToState(MqttEvent event,) async* {
    if (event is MqttStarted) {
      yield ConfigureMqttState();
    }
    if (event is ConnectMqtt) {
      yield ConnectingMqttState();
      final client = await mqtt_repository.connect(event.host, event.port,
          username: event.username, password: event.password);
      yield client == null ? ConfigureMqttState() : ConnectedMqttState(client);
    }
  }
}
