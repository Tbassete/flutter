import 'dart:ffi';

import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int nota;
  final void Function() quandoReiniciarQuestionario;
  // Construtor
  Resultado(this.nota, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (nota < 8) {
      return 'MOLO';
    } else if (nota < 30) {
      return 'LODOY';
    } else if (nota >= 30) {
      return 'molodoyyy p@@';
    } else {
      // Este else cobre o intervalo entre 20 e 29 que estava faltando
      return 'Nível desconhecido';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text(fraseResultado, style: TextStyle(fontSize: 28))),
        FloatingActionButton(
          child: Text('Reiniciar'),
          onPressed: quandoReiniciarQuestionario,
        ),
      ],
    );
  }
}
