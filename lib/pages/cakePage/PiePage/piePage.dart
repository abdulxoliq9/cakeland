
import 'package:cakeland/pages/cakePage/PiePage/widgetPie.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../home/homePage.dart';

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
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.red.shade200,
          elevation: 0,
          title: Text('Pie',
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
                      'assets/images/pieNew.jpg'
                  ),
                  ),
                ),
              ),
            ),
            Expanded(child: ListView(
              children: const [
                WidgetPie(name: 'Strawberry Pie',withl: 'with strawberry and jam', price: '12',),
                WidgetPie(name: 'Raspberry Pie',withl: 'with raspberry and jam', price: '13.5',),
                WidgetPie(name: 'Apple Pie',withl: 'with apple and jam', price: '9.8',),
              ],
            ),)

          ],
        )
    );
  }
}
