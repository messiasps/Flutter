import 'package:flutter/material.dart'; //Aqui é onde vai ficar todo o design da nossa aplicação
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
  var _pontuacaoTotal = 0;

  List<Map<String, Object>> _perguntas = []; //Uma lista de perguntas e dentro dessa lista, os elementos será do tipo MAP

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {//muda o estado da aplicação faz o incremento.
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
    print(_pontuacaoTotal);
  }

  

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    _perguntas = const [
      {
        'texto': 'Qual sua cor favorita?', //'chave': 'valor',
        'respostas': [
          {'texto': 'Preto', 'pontuacao': 10},
          {'texto': 'Vermelho', 'pontuacao': 5},
          {'texto': 'Verde', 'pontuacao': 3}, 
          {'texto': 'Branco', 'pontuacao': 1},
          ],
      },
      {
        'texto': 'Qual é o seu animal favorito?',
        'respostas': [
          {'texto': 'Coelho', 'pontuacao': 10},
          {'texto': 'Cobra', 'pontuacao': 5},
          {'texto': 'Elefante', 'pontuacao': 3}, 
          {'texto': 'Leão', 'pontuacao': 1},
        ],
      },
      {
        'texto': 'Qual é o seu instrutor favorito?',
        'respostas': [
         {'texto': 'Maria', 'pontuacao': 10}, 
         {'texto': 'João', 'pontuacao': 10}, 
         {'texto': 'Leo', 'pontuacao': 10}, 
         {'texto': 'Pedro', 'pontuacao': 10}
         ],
      }
    ];

    //List<Widget> respostas = [];//lista de respostas
    //for (String textoResp in perguntas[_perguntaSelecionada].cast()['respostas']) {
    //respostas.add(Resposta(textoResp, _responder));
    //}

    //Tem pergunta selecionada? Caso sim, pega as perguntas e joga para Questionario(), caso contrário vai para Resultado()
    return MaterialApp(//aqui é onde vai ficar todo o design da nossa aplicação
      home: Scaffold(//É o layout da aplicação
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                //parâmetros nomeados.
                perguntas: _perguntas,//A pergunta(Qual sua cor favorita?).
                perguntaSelecionada: _perguntaSelecionada,//Índice que vai percorrer a lista.
                quandoResponder: _responder,//A mudança de estado da aplicação.
            )
            : Resultado(_pontuacaoTotal),
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
