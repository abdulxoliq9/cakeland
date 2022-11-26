import 'package:flutter/material.dart';

class DonutCakePage extends StatefulWidget {
  const DonutCakePage({Key? key}) : super(key: key);

  static final String id = 'donut_cake_page';
  @override
  State<DonutCakePage> createState() => _DonutCakePageState();
}

class _DonutCakePageState extends State<DonutCakePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Donut Page'),
      ),
    );
  }
}
