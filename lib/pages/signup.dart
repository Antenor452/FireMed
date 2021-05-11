import 'package:final_year_project_app/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.headlandOneTextTheme()),
      home: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  colors: [Colors.orangeAccent, Colors.orange, Colors.red])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Enter your details to create an account',
                  style: GoogleFonts.headlandOne(
                      fontSize: 18, color: Colors.white)),
              SizedBox(
                height: 18,
              ),
              Container(
                width: 330,
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Fidas Id',
                      labelStyle: GoogleFonts.headlandOne(color: Colors.white),
                      prefixIcon: Icon(
                        Icons.info_outlined,
                        color: Colors.white,
                      )),
                ),
              ),
              Container(
                width: 330,
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: GoogleFonts.headlandOne(color: Colors.white),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.white,
                      )),
                ),
              ),
              Container(
                width: 330,
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: GoogleFonts.headlandOne(color: Colors.white),
                      prefixIcon: Icon(
                        Icons.vpn_key,
                        color: Colors.white,
                      )),
                ),
              ),
              Container(
                width: 330,
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Phone Number',
                      labelStyle: GoogleFonts.headlandOne(color: Colors.white),
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Colors.white,
                      )),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              InkWell(
                child: Container(
                  width: 330,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    'SIGN UP',
                    style: GoogleFonts.headlandOne(color: Colors.orange),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              InkWell(
                child: Container(
                  width: 330,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.white)),
                  child: Text(
                    'LOGIN',
                    style: GoogleFonts.headlandOne(color: Colors.white),
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
