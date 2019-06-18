import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationState extends Equatable {
  AuthenticationState([List props = const []]) : super(props);
}

class InitialAuthenticationState extends AuthenticationState {
  @override
  String toString() => 'Initial';
}

class AuthenticationUnauthenticated extends AuthenticationState {
  @override
  String toString() => "Unauthenticated";
}

class AutheticationAuthenticated extends AuthenticationState {
  @override
  String toString() => 'Authenticated';
}
