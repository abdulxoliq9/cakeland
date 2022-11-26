
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
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 25),
        child: Text(caketype,
          style: GoogleFonts.staatliches(
              fontSize: 20,
              color: selected ? Colors.red[800] : Colors.red[100]
          ),
        ),
      ),
    );
  }
}
