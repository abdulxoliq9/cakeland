
import 'package:flutter/material.dart';

class PieCakePage extends StatefulWidget {
  const PieCakePage({Key? key}) : super(key: key);

  static final String id = 'pie_cake_page';
  @override
  State<PieCakePage> createState() => _PieCakePageState();
}

class _PieCakePageState extends State<PieCakePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Pie Page'),
      ),
    );
  }
}
