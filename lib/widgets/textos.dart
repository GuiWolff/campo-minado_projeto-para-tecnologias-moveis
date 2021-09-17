
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextBody extends StatelessWidget {
  final String text;
  final TextAlign? alignment;
  final double? larguraMaxima;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;

  TextBody(this.text,
      {this.alignment, this.larguraMaxima, required this.color, this.fontWeight = FontWeight.bold, this.fontSize = 10});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: larguraMaxima,
      child: Text(text,
          textAlign: alignment,
          style: GoogleFonts.sourceSansPro(
              fontWeight: fontWeight, color: color, fontSize: fontSize)),
    );
  }
}