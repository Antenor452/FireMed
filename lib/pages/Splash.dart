import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.orangeAccent,
              Colors.orange,
              Colors.red,
            ])),
        child: Center(
            child: Text('FireMed',
                style: GoogleFonts.headlandOne(
                  fontSize: 30,
                  color: Colors.white,
                ))),
      ),
    );
  }
}
