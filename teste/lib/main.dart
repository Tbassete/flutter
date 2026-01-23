import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      perguntaSelecionada++;
    });
    print(perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> perguntas = [
      {
        'texto': 'quem é',
        'respostas': ['molodoy', 'niko', 'monesy', 'donk'],
      },
      {
        'texto': 'é molodoy ou não é',
        'respostas': ['é', 'é molodoy', 'não é', 'é molodoy porra'],
      },
      {
        'texto': 'g???3???',
        'respostas': ['x?????', 'y', 'u', 'p'],
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Perguntas')),
        body: Column(
          children: <Widget>[
            Questao(perguntas[perguntaSelecionada]['texto'].toString()),
            Resposta('resposta 1', _responder),
            Resposta('resposta 2', _responder),
            Resposta('resposta 3', _responder),
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
