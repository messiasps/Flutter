import 'package:flutter/material.dart'; //Aqui é onde vai ficar todo o design da nossa aplicação
import './resultado.dart';//Importando o componente resultado
import './questionario.dart';//Importando o componente resultado

main() => runApp(PerguntaApp());
/*
=> Os parametros fica no lado esquerdo da seta, já o corpo da função fica do lado direito da seta
Não é necessario colocar a palavra function e return e sem o uso de {}, por isso é bem simples de usar

Codigo abixo faz a mesma coisa do de cima
main () {
  runApp(PerguntaApp);
}
*/

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0; //Índice que vai percorrer a lista.
  var _pontuacaoTotal = 0; 

  List<Map<String, Object>> _perguntas = []; //Uma lista de perguntas e dentro dessa lista, os elementos será do tipo MAP.

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {//Muda o estado da aplicação, faz o incremento.
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    _perguntas = const [
      {
        'texto': 'Qual sua cor favorita?', //'chave': 'valor',
        'respostas': [//O valor da CHAVE respostas é uma lista e dentro dessa lista tenho um MAP com uma CHAVE texto e OUTRA pontuação.
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
        //backgroundColor: Color.fromARGB(255, 0, 0, 0),//Cor de fundo para o aplicação.
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 6, 148, 91),//Cor de fundo para a barra superior.
          title: const Text('Perguntas'),//Titulo da barra superior.
        ),
        body: temPerguntaSelecionada //Caso a pergunta selecionada seja true, faz o questionário.
            ? Questionario(
                //parâmetros nomeados.
                perguntas: _perguntas,//A pergunta (Qual sua cor favorita?).
                perguntaSelecionada: _perguntaSelecionada,//Índice que vai percorrer a lista.
                quandoResponder: _responder,//A mudança de estado da aplicação.
            ) //Caso a pergunta selecionada seja false, mostra o resultado.
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  //StatefulWidget: É um estado mutável, ou seja com estado, porém o que seria um estado?
  //um estado é basicamente uma informação ou grupo de informações que são alterados em 
  //tempo de execução do aplicativo, ou seja são momentos que o aplicativo pode possuir.
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
