import 'package:final_year_project_app/pages/dashboard.dart';
import 'package:final_year_project_app/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(Home());
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future _getCurrentUser() async {
    print('started');
    var user = await FirebaseAuth.instance.currentUser;
    print(user);

    return User;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: _getCurrentUser(),
          builder: (BuildContext context, AsyncSnapshot snaphot) {
            if (snaphot.hasData) {
              UserCredential user = snaphot.data;
              return Dashboard();
            } else {
              return Login();
            }
          },
        ));
  }
}
