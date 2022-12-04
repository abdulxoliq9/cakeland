import 'package:cakeland/pages/cakePage/SweetPage/widgetSweet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../home/homePage.dart';

class SweetCakePage extends StatefulWidget {
  const SweetCakePage({Key? key}) : super(key: key);

  static const String id = 'sweet_cake_page';
  @override
  State<SweetCakePage> createState() => _SweetCakePageState();
}

class _SweetCakePageState extends State<SweetCakePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.red.shade200,
          elevation: 0,
          title: Text('Sweet',
            style: GoogleFonts.bebasNeue(
                fontSize: 35,color: Colors.red.shade50
            ),),
          leading: GestureDetector(
              onTap: (){
                Navigator.pushReplacementNamed(context, HomePage.id);
              },
              child: const Icon(Icons.keyboard_arrow_left_rounded)),
        ),
        backgroundColor: Colors.red.shade50,
        body: Column(
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.all(10),
                height: 200,

                child: const ClipOval(
                  child: Image(image: AssetImage(
                      'assets/images/sweet.jpg'
                  ),
                  ),
                ),
              ),
            ),
            Expanded(child: ListView(
              children: const [
                WidgetSweet(name: 'Small Cake',withl: 'with condensed milk and cream', price: '14.2',),
                WidgetSweet(name: 'Big Cake',withl: 'with condensed milk and cream', price: '15.6',),
                WidgetSweet(name: 'Choco Cake',withl: 'with condensed milk, cream and choco', price: '17',),
              ],
            ),)

          ],
        )
    );
  }
}
