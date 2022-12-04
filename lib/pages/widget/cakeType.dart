
import 'package:cakeland/pages/cakePage/CookiePage/cookiePage.dart';
import 'package:cakeland/pages/cakePage/DonutPage/donutPage.dart';
import 'package:cakeland/pages/cakePage/FruitlyPage/fruitlyPage.dart';
import 'package:cakeland/pages/cakePage/PiePage/piePage.dart';
import 'package:cakeland/pages/cakePage/SweetPage/sweetPage.dart';
import 'package:cakeland/pages/home/homePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CakeType extends StatelessWidget {
  const CakeType({Key? key,
    required this.onTap,
    required this.selected,
    required this.caketype}) : super(key: key);
  final bool selected;
  final String caketype;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap;
        switch(caketype){
          case 'Popular':
            break;
          case 'Pie':
            Navigator.pushReplacementNamed(context, PieCakePage.id);
            break;
          case 'Donut':
            Navigator.pushReplacementNamed(context, DonutCakePage.id);
            break;
          case 'Cookie':
            Navigator.pushReplacementNamed(context, CookieCakePage.id);
            break;
          case 'Fruitly':
            Navigator.pushReplacementNamed(context, FruitlyCakePage.id);
            break;
          case 'Sweet':
            Navigator.pushReplacementNamed(context, SweetCakePage.id);
            break;
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 17),
        child: Text(caketype,
          style: GoogleFonts.staatliches(
              fontSize: selected ? 22 : 20,
              color: selected ? Colors.red[800] : Colors.red[200]
          ),
        ),
      ),
    );
  }
}
