import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent([List props = const []]) : super(props);
}

class AppStarted extends AuthenticationEvent {
  @override
  String toString() => 'Initializing';
}

class LoggedIn extends AuthenticationEvent {
  final String username;
  final String password;

  LoggedIn(this.username, this.password);

  @override
  String toString() => 'LoggedIn';
}

class LoggedOut extends AuthenticationEvent {
  @override
  String toString() {
    return 'LoggedOut';
  }
}
