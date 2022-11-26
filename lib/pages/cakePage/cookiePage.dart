import 'package:flutter/material.dart';

class CookieCakePage extends StatefulWidget {
  const CookieCakePage({Key? key}) : super(key: key);

  static final String id = 'cookie_cake_page';
  @override
  State<CookieCakePage> createState() => _CookieCakePageState();
}

class _CookieCakePageState extends State<CookieCakePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Cookie Page'),
      ),
    );
  }
}
