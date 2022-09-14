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
          primary: Color.fromARGB(255, 149, 33, 243), //Cor do botão.
          onPrimary: Colors.white, //Cor do texto dentro do botão.
        ),
        onPressed: quandoSelecionado,
        child: Text(texto),
      ),
    );
  }
}
