import 'dart:async';

import 'package:final_year_project_app/pages/Splash.dart';
import 'package:final_year_project_app/pages/dashboard.dart';
import 'package:final_year_project_app/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';

void main(List<String> args) {
  runApp(Home());
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget? home = Splash();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          print('User is not signed in');
          setState(() {
            home = Login();
          });
        } else {
          print('user is signed in');
          print(user.email);
          setState(() {
            home = Dashboard();
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.headlandOneTextTheme(),
        ),
        debugShowCheckedModeBanner: false,
        home: home);
  }
}
