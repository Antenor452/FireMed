import 'package:final_year_project_app/pages/dashboard.dart';
import 'package:final_year_project_app/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool hidepassword = true;
  GlobalKey<FormState> _formstate = GlobalKey();
  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                style:
                    GoogleFonts.headlandOne(fontSize: 24, color: Colors.white)),
            SizedBox(
              height: 24,
            ),
            Form(
                key: _formstate,
                child: Column(
                  children: [
                    Container(
                      width: 330,
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                          labelText: 'Email',
                          labelStyle:
                              GoogleFonts.headlandOne(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                        ),
                        style: GoogleFonts.headlandOne(color: Colors.white),
                        validator: (input) {
                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(input.toString());
                          if (emailValid) {
                          } else {
                            return 'Please enter a valid email';
                          }
                        },
                        onSaved: (input) {
                          _email = input;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: 330,
                      child: TextFormField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 18, vertical: 6),
                            labelText: 'Password',
                            labelStyle:
                                GoogleFonts.headlandOne(color: Colors.white),
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
                        validator: (input) {
                          if (input!.length < 6) {
                            return 'Please enter a valid password';
                          }
                        },
                        onSaved: (input) {
                          _password = input;
                        },
                      ),
                    ),
                  ],
                )),
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
              onTap: signIn,
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
    );
  }

  Future<void> signIn() async {
    FocusScope.of(context).unfocus();
    FormState? cform = _formstate.currentState;
    if (cform!.validate()) {
      cform.save();
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: _email.toString(), password: _password.toString());
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Dashboard()));
      } on FirebaseAuthException catch (e) {
        print(e.code);
        switch (e.code) {
          case 'user-not-found':
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Invalid User Details')));
            break;
        }
      }
    }
  }
}
