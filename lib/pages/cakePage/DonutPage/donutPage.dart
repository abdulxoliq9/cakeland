import 'package:cakeland/pages/cakePage/DonutPage/widgetDonut.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../home/homePage.dart';

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
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.red.shade200,
          elevation: 0,
          title: Text('Donut',
            style: GoogleFonts.bebasNeue(
                fontSize: 35,color: Colors.red.shade50
            ),),
          leading: GestureDetector(
              onTap: (){
                Navigator.pushReplacementNamed(context, HomePage.id);
              },
              child: Icon(Icons.keyboard_arrow_left_rounded)),
        ),
        backgroundColor: Colors.red.shade50,
        body: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.all(10),
                height: 200,

                child: const ClipOval(
                  child: Image(image: AssetImage(
                      'assets/images/donutNew.jpg'
                  ),
                  ),
                ),
              ),
            ),
            Expanded(child: ListView(
              children: [
                WidgetDonut(name: 'Small Donut',withl: 'with chocolate or jam', price: '7.8',),
                WidgetDonut(name: 'Big Donut',withl: 'with chocolate or jam', price: '8.5',),
                WidgetDonut(name: 'Choco Donut',withl: 'with chocolate and condensed milk', price: '10',),
              ],
            ),)

          ],
        )
    );
  }
}
