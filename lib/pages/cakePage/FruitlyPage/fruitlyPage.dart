import 'package:cakeland/pages/cakePage/FruitlyPage/widgetFruitly.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../home/homePage.dart';

class FruitlyCakePage extends StatefulWidget {
  const FruitlyCakePage({Key? key}) : super(key: key);

  static const String id = 'fruitly_cake_page';
  @override
  State<FruitlyCakePage> createState() => _FruitlyCakePageState();
}

class _FruitlyCakePageState extends State<FruitlyCakePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.red.shade200,
          elevation: 0,
          title: Text('Fruitly cake',
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
                      'assets/images/fruity.jpg'
                  ),
                  ),
                ),
              ),
            ),
            Expanded(child: ListView(
              children: const [
                WidgetFruitly(name: 'Strawberry Cake',withl: 'with strawberry and candy', price: '18.3',),
                WidgetFruitly(name: 'Banana Cake',withl: 'with banana and candy', price: '15.7',),
                WidgetFruitly(name: 'Kiwi Cake',withl: 'with kiwi and candy', price: '19.2',),
              ],
            ),)

          ],
        )
    );
  }
}
