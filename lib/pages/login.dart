import 'package:final_year_project_app/pages/dashboard.dart';
import 'package:final_year_project_app/pages/signup.dart';
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
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                    labelText: 'Email',
                    labelStyle: GoogleFonts.headlandOne(color: Colors.white),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                  ),
                  style: GoogleFonts.headlandOne(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                width: 330,
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                      labelText: 'Password',
                      labelStyle: GoogleFonts.headlandOne(color: Colors.white),
                      prefixIcon: Icon(
                        Icons.vpn_key,
                        color: Colors.white,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: Colors.white,
                        ),
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
                  style: GoogleFonts.headlandOne(color: Colors.white),
                  obscureText: hidepassword,
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 18),
                alignment: Alignment.topRight,
                child: TextButton(
                  child: Text(
                    'Forgot your password?',
                    style: GoogleFonts.headlandOne(color: Colors.white),
                  ),
                  onPressed: () {},
                ),
              ),
              InkWell(
                child: Container(
                    width: 330,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.white)),
                    child: Center(
                      child: Text('LOGIN',
                          style: GoogleFonts.headlandOne(color: Colors.orange)),
                    )),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Dashboard()));
                },
              ),
              SizedBox(
                height: 12,
              ),
              InkWell(
                child: Container(
                  width: 330,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.white)),
                  child: Center(
                      child: Text(
                    'SIGN UP',
                    style: GoogleFonts.headlandOne(color: Colors.white),
                  )),
                ),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return SignUp();
                  }));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
