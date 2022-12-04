import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetCookie extends StatelessWidget {

  const WidgetCookie({
    required this.name,
    required this.withl,
    required this.price,

    Key? key}) : super(key: key);
  final String name;
  final String withl;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(right: 20,left: 20,top: 15),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 80,
        decoration: BoxDecoration(
            color: Colors.red.shade100,
            borderRadius: BorderRadius.circular(7)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(name,style: GoogleFonts.satisfy(
                    fontSize: 25,fontWeight: FontWeight.bold,
                    color: Colors.red.shade300
                ),),
                Text(withl,style:
                GoogleFonts.ubuntu(
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),)
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text('\$',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.5,color: Colors.green
                    ),),
                    SizedBox(width: 7,),
                    Text(price,style: GoogleFonts.lobster(
                      fontSize: 20,color: Colors.red.shade400,
                    ),)
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.add_circle_outlined,color: Colors.red,),
                  ],
                )
              ],
            )

          ],
        ),
      ),);
  }
}
