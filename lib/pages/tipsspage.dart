import 'package:final_year_project_app/widgets/draweritems.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TipsPage extends StatefulWidget {
  @override
  _TipsPageState createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Tips and Tricks',
            style: GoogleFonts.headlandOne(),
          ),
          centerTitle: true,
          backgroundColor: Colors.orange,
        ),
        drawer: DrawerItems(),
        body: Container(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
