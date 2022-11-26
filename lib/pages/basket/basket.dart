import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../home/homePage.dart';
import '../settingPage/setting.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({Key? key}) : super(key: key);

  static const String id = 'basket_page';
  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      body:  Center(
        child:  FlatButton(
          color: Colors.green.shade200,
          onPressed: () {
            Navigator.pushReplacementNamed(context, HomePage.id);},
          child: Text('BasketPage'),
        ),
      ),
      // bottomNavigationBar: CurvedNavigationBar(
      //   height: 50,
      //   //currentIndex: _navIndex,
      //   onTap: navBottom,
      //   backgroundColor: Colors.red.shade50,
      //   color: Colors.red.shade200,
      //   animationDuration: Duration(milliseconds: 300),
      //   items: [
      //     Icon(Icons.home_filled,color: _navIndex == 0 ? Colors.redAccent[400] : Colors.red[50],),
      //     Icon(Icons.settings,color:  _navIndex == 1 ? Colors.redAccent[400] : Colors.red[50],),
      //     Icon(Icons.shopping_bag,color:  _navIndex == 2 ? Colors.redAccent[400] : Colors.red[50],),
      //   ],
      // ),
    );
  }
}


