import 'package:final_year_project_app/pages/Signup.dart';
import 'package:final_year_project_app/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController txtemail;
  TextEditingController txtpass;

  bool hidepassword = true;

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
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Colors.orangeAccent,
                Colors.orange,
                Colors.red,
              ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Sign in to your account',
                  style: GoogleFonts.headlandOne(
                      fontSize: 24, color: Colors.white)),
              SizedBox(
                height: 24,
              ),
              Container(
                  width: 330,
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  decoration: BoxDecoration(color: Colors.white),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.email)),
                    textAlign: TextAlign.center,
                  )),
              SizedBox(
                height: 18,
              ),
              Container(
                width: 330,
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 18),
                decoration: BoxDecoration(color: Colors.white),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.vpn_key),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.remove_red_eye),
                        onPressed: () {
                          setState(() {
                            if (hidepassword) {
                              hidepassword = false;
                            } else {
                              hidepassword = true;
                            }
                          });
                        },
                      )),
                  textAlign: TextAlign.center,
                  obscureText: hidepassword,
                ),
              ),
              SizedBox(
                height: 18,
              ),
              InkWell(
                child: Container(
                  width: 330,
                  padding: EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(color: Colors.lightBlue),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.login,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Dashboard()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
