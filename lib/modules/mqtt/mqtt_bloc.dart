import 'dart:async';

import 'package:bloc/bloc.dart';

import './bloc.dart';

class MqttBloc extends Bloc<MqttEvent, MqttState> {
  @override
  MqttState get initialState => InitialMqttState();

  @override
  Stream<MqttState> mapEventToState(
    MqttEvent event,
  ) async* {
    if (event is MqttStarted) {
      yield ConfigureMqttState();
    }
    if (event is ConnectMqtt) {
      yield ConnectingMqttState();
    }
  }
}
