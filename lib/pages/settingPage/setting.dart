import 'package:cakeland/pages/home/homePage.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  static final String id = 'setting_page';
  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      body:  Center(
         child:  FlatButton(
        color: Colors.purple.shade200,
        onPressed: () { Navigator.pushReplacementNamed(context, HomePage.id);},
        child: Text('SettingPage'),
      ),
      ),
    );
  }
}
