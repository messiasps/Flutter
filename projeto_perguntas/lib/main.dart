import 'package:flutter/material.dart'; //aqui é onde vai ficar todo o design da nossa aplicação
import './resultado.dart';
import './questionario.dart';

main() => runApp(PerguntaApp());
/*
=> Os  parametros fica no lado esquerdo da seta, já o corpo da função fica do lado direito da seta
Não é necessario colocar a palavra function e return e sem o uso de {}, por isso é bem simples de usar

codigo abixo  faz a mesma coisa do de cima
main () {
  runApp(PerguntaApp);
}
*/

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0; //Índice que vai percorrer a lista.
  List<Map<String, Object>> _perguntas = []; //Uma lista de perguntas e dentro dessa lista, os elementos será do tipo MAP

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {//muda o estado da aplicação faz o incremento.
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    _perguntas = const [
      {
        'texto': 'Qual sua cor favorita?', //'chave': 'valor',
        'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco'],
      },
      {
        'texto': 'Qual é o seu animal favorito?',
        'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão'],
      },
      {
        'texto': 'Qual é o seu instrutor favorito?',
        'respostas': ['Maria', 'João', 'Leo', 'Pedro'],
      }
    ];

    //List<Widget> respostas = [];//lista de respostas
    //for (String textoResp in perguntas[_perguntaSelecionada].cast()['respostas']) {
    //respostas.add(Resposta(textoResp, _responder));
    //}

    //tem pergunta selecionada, caso sim pega as pergunta e joga para respostas, caso contrário coloca null
    return MaterialApp(
      //aqui é onde vai ficar todo o design da nossa aplicação
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                //parâmetros nomeados.
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder)
            : Resultado(),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
