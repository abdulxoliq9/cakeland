import 'package:flutter/material.dart';

class FruitlyCakePage extends StatefulWidget {
  const FruitlyCakePage({Key? key}) : super(key: key);

  static final String id = 'fruitly_cake_page';
  @override
  State<FruitlyCakePage> createState() => _FruitlyCakePageState();
}

class _FruitlyCakePageState extends State<FruitlyCakePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Fruitly Page'),
      ),
    );
  }
}
