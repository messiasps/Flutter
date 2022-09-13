import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function() quandoResponder;

  Questionario({
    //construtor nomeado
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quandoResponder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];
    return Column(
      children: [ 
        //child no caso de haver apenas um filho, ou children, para muitos filhos
        Questao(perguntas[perguntaSelecionada]['texto'].toString()), //outro componente, componente separado.
        ...respostas.map((t) => Resposta(t, quandoResponder)).toList(), //todos os elementos da lista será adicionado na outra lista
        //...todos os elementos dessa lista seja adicionado nessa outra lista.
        //vai pegar os elementos da lista respostas e 'jogar' dentro da lista questão que pertence ao column
        //sintaxe spread
        //Resposta(t, _responder)).toList() -> implicidamente tem um new antes de Resposta cria uma resposta
//respostas.map((t) => Resposta(t, _responder)).toList()
//codigo acima vai fazer o seguinte, (t) -> vai receber os valores textual(nomes das cores), quandoResponder está passando o índice da pergunta selecionada => vou coneverter esse texto em um componente do tipo resposta
        //converter a lista de string em lista de widgets, após a conversão coloca o toList para uma lista
      ],
    );
  }
}
