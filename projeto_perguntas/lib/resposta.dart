import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() quandoSelecionado;

  Resposta(this.texto, this.quandoSelecionado);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color.fromARGB(255, 6, 148, 91), //Cor do botão.
          onPrimary: Color.fromARGB(255, 255, 255, 255), //Cor do texto dentro do botão.
        ),
        onPressed: quandoSelecionado,
        child: Text(texto),
      ),
    );
  }
}
