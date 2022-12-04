import 'package:cakeland/pages/cakePage/CookiePage/widgetCookie.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../home/homePage.dart';

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
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red.shade200,
        elevation: 0,
        title: Text('Cookie',
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
                    'assets/images/cookieNew.jpg'
                ),
                ),
              ),
            ),
          ),
         Expanded(child: ListView(
           children: [
             WidgetCookie(name: 'Small Cookie',withl: 'with condensed milk', price: '4.7',),
             WidgetCookie(name: 'Big Cookie',withl: 'with condensed milk', price: '5.7',),
             WidgetCookie(name: 'Choco Cookie',withl: 'with choco and condensed milk', price: '6.5',),
           ],
         ),)

        ],
      )
    );
  }
}
