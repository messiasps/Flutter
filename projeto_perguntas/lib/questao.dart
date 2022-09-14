import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  final String texto;

  Questao(this.texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      //Aqui vou colocar estilo nas perguntas.
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Text(
        texto,
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w500,
          color: Color.fromARGB(255, 0, 0, 0),
          ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
