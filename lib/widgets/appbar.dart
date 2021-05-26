import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'FIREMED',
        style: GoogleFonts.headlandOne(),
      ),
      centerTitle: true,
      backgroundColor: Colors.orange,
    );
  }
}
