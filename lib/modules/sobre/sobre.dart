import 'package:flutter/material.dart';
import 'package:flutter_mqtt/modules/scaffold/scaffold.dart';

class Sobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Divider(height: 20),
                    Image.asset(
                      'images/minerva_blue.png',
                      height: 150,
                    ),
                    Divider(height: 20),
                    ListTile(
                      title: Text(
                        "Projeto desenvolvido para a disciplina de robótica no curso de Engenharia de Computação pela Universidade Estadual de Ponta Grossa.",
                        style: TextStyle(color: Colors.black),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                    ListTile(
                      title: Text(
                        "O objetivo é um sistema para controlar um robô, trocando informação com a utilização do protocolo MQTT",
                        style: TextStyle(color: Colors.black),
                      ),
                      contentPadding: EdgeInsets.all(20),
                    ),
                  ],
                ),
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 10),
              )
            ],
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10),
      ),
    );
  }
}
