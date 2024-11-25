import 'package:flutter/material.dart';

class HallManager extends StatelessWidget {
  const HallManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hall Manager'),
        ),
        body: const Center(
          child: Text('Let\'s manage our hall!'),
        ),
      ),
    );
  }
}
