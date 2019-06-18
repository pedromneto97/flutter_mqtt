import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modules/authentication/bloc.dart';
import 'modules/home/Home.dart';
import 'modules/splash/SplashScreen.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  State createState() => _AppState();
}

class _AppState extends State<App> {
  AuthenticationBloc auth;

  @override
  void initState() {
    super.initState();
    auth = AuthenticationBloc();
    auth.dispatch(AppStarted());
  }

  @override
  void dispose() {
    auth.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MQTT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: BlocBuilder(
          bloc: auth,
          builder: (context, AuthenticationState state) {
            if (state is InitialAuthenticationState) {
              return SplashScreen();
            }
            if (state is AuthenticationUnauthenticated) {
              return Home();
            }
          }),
    );
  }
}
