import 'dart:async';

import 'package:bloc/bloc.dart';

import './bloc.dart';

class MqttConnectedBloc extends Bloc<MqttConnectedEvent, MqttConnectedState> {
  @override
  MqttConnectedState get initialState => InitialMqttConnectedState();

  @override
  Stream<MqttConnectedState> mapEventToState(
    MqttConnectedEvent event,
  ) async* {
    if (event is InitialMqttConnectedState) {
      yield InitialMqttConnectedState();
    }
    if (event is Publish) {
      yield PublishInfoState();
    }
  }
}
