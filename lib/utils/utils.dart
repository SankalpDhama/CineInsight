import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class modifiedText extends StatelessWidget{
  const modifiedText({super.key,required this.text, this.col, this.size});
  final String text;
  final Color? col;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.breeSerif(
        fontSize: size,
        color: col,
      ),
    );
  }
}
