import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_mqtt/modules/authentication/bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  @override
  AuthenticationState get initialState => InitialAuthenticationState();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      yield AuthenticationUnauthenticated();
    }
    if (event is LoggedIn) {
      yield AutheticationAuthenticated();
    }
    if (event is LoggedOut) {
      yield AuthenticationUnauthenticated();
    }
  }
}
