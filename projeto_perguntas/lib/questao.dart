import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  final String texto;

  Questao(this.texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      //Aqui vou colocar estilo nas perguntas.
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        texto,
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w500,
          color: Color.fromARGB(255, 240, 240, 7),
          ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
