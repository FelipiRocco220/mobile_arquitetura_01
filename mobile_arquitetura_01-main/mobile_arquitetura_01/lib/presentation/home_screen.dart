import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tela Inicial')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Ver Produtos'),
          onPressed: () {
            Navigator.pushNamed(context, '/produtos');
          },
        ),
      ),
    );
  }
}
