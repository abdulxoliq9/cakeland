import 'package:flutter/material.dart';

class SweetCakePage extends StatefulWidget {
  const SweetCakePage({Key? key}) : super(key: key);

  static final String id = 'sweet_cake_page';
  @override
  State<SweetCakePage> createState() => _SweetCakePageState();
}

class _SweetCakePageState extends State<SweetCakePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Sweet Page'),
      ),
    );
  }
}
