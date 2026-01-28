import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;
  var pontuacaoTotal = 0;
  void _responder(int nota) {
    if (temPerguntaSelecionada) {
      setState(() {
        perguntaSelecionada++;
        pontuacaoTotal += nota;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      perguntaSelecionada = 0;
      pontuacaoTotal = 0;
    });
  }

  final List<Map<String, Object>> _perguntas = [
    {
      'texto': 'quem é??',
      'respostas': [
        {'texto': 'molodoy', 'nota': 10},
        {'texto': 'niko', 'nota': 3},
        {'texto': 'monesy', 'nota': 3},
        {'texto': 'donk', 'nota': 4},
      ],
    },
    {
      'texto': 'é molodoy ou não é',
      'respostas': [
        {'texto': 'é', 'nota': 5},
        {'texto': 'é molodoy', 'nota': 7},
        {'texto': 'não é', 'nota': 0},
        {'texto': 'é molodoy porra', 'nota': 10},
      ],
    },
    {
      'texto': 'g???3???',
      'respostas': [
        {'texto': 'x?????', 'nota': 10},
        {'texto': 'y', 'nota': 0},
        {'texto': 'u', 'nota': 0},
        {'texto': 'p', 'nota': 0},
      ],
    },
  ];

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Perguntas')),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntaSelecionada: perguntaSelecionada,
                perguntas: _perguntas,
                responder: _responder,
              )
            : Resultado(pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
