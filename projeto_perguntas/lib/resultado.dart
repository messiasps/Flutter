import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  Resultado();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Parabéns!',
        style: TextStyle(
          fontSize: 28,
        ),
      ),
    );
  }
}
