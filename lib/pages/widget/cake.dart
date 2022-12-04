
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cake_tile extends StatelessWidget {
  const Cake_tile({Key? key,
    required this.cakeImage,
    required this.cakeName,
    required this.cakeContent,
    required this.cakePrice,
  }) : super(key: key);

  final String cakeImage;
  final String cakeName;
  final String cakeContent;
  final String cakePrice;
  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Container(
        padding: EdgeInsets.all(11),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          color: Colors.red[100],),
        width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(11),
              child: Image.asset(cakeImage,
                fit: BoxFit.cover,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Text(cakeName,style: GoogleFonts.satisfy(
                  fontSize: 23,
                  color: Colors.red[900]
              )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Text(cakeContent,
                style: TextStyle(color: Colors.red[200]),),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$$cakePrice',style:
                  TextStyle(color: Colors.red),),
                  Icon(Icons.add_circle_outlined,color: Colors.red,)
                ],
              ),
            )
          ],
        ),
      ),
      padding:EdgeInsets.only(right: 20,bottom: 20),

    );
  }
}
