import 'dart:async';

import 'package:final_year_project_app/pages/Splash.dart';
import 'package:final_year_project_app/pages/dashboard.dart';
import 'package:final_year_project_app/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

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
      StreamSubscription<User?> CurrentUser =
          FirebaseAuth.instance.authStateChanges().listen((user) {});

      if (CurrentUser == null) {
        print('User is currently signed out');
        home = Login();
      } else {
        print('User is signed in');
        setState(() {
          home = Dashboard();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: home);
  }
}
