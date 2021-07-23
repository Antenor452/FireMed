import 'package:final_year_project_app/pages/dashboard.dart';
import 'package:final_year_project_app/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String? _email;
  String? _password;
  String? _username;
  String? _phone;
  String? _fidas;
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
                    begin: Alignment.topLeft,
                    end: Alignment.bottomLeft,
                    colors: [Colors.orangeAccent, Colors.orange, Colors.red])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Create a new account',
                    style: GoogleFonts.headlandOne(
                        fontSize: 24, color: Colors.white)),
                SizedBox(
                  height: 24,
                ),
                Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        Container(
                          width: 330,
                          child: TextFormField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 6),
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
                        Container(
                          width: 330,
                          child: TextFormField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 6),
                              labelText: 'Username',
                              labelStyle:
                                  GoogleFonts.headlandOne(color: Colors.white),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                            ),
                            style: GoogleFonts.headlandOne(color: Colors.white),
                            validator: (input) {
                              if (input!.length < 3) {
                                return 'Please enter a username of valid length';
                              }
                            },
                            onSaved: (input) {
                              _username = input;
                            },
                          ),
                        ),
                        Container(
                          width: 330,
                          child: TextFormField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 6),
                              labelText: 'Phone',
                              labelStyle:
                                  GoogleFonts.headlandOne(color: Colors.white),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                            ),
                            style: GoogleFonts.headlandOne(color: Colors.white),
                            validator: (input) {
                              if (input!.length != 10) {
                                return 'Please enter a valid phone number';
                              }
                            },
                            onSaved: (input) {
                              _phone = input;

                              print(_phone.toString());
                            },
                          ),
                        ),
                        Container(
                          width: 330,
                          child: TextFormField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 6),
                              labelText: 'Fidas ID',
                              labelStyle: TextStyle(color: Colors.white),
                              prefixIcon: Icon(
                                Icons.important_devices,
                                color: Colors.white,
                              ),
                            ),
                            onSaved: (input) {
                              _fidas = input.toString();
                              if (input!.length < 5) {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                        'Fidas ID is required to connect your Fidas device to your account')));
                              }
                            },
                          ),
                        ),
                        Container(
                          width: 330,
                          child: TextFormField(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 6),
                                labelText: 'Password',
                                labelStyle: GoogleFonts.headlandOne(
                                    color: Colors.white),
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
                SizedBox(
                  height: 12,
                ),
                InkWell(
                  child: Container(
                    width: 330,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white),
                    child: Center(
                        child: Text(
                      'SIGN UP',
                      style: GoogleFonts.headlandOne(color: Colors.orange),
                    )),
                  ),
                  onTap: SignUp,
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
                        child: Text('LOGIN',
                            style:
                                GoogleFonts.headlandOne(color: Colors.white)),
                      )),
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                ),
              ],
            )),
      ),
    );
  }

  SignUp() async {
    print('start');
    FocusScope.of(context).unfocus();
    FormState? _cform = _formkey.currentState;
    if (_cform!.validate()) {
      _cform.save();
      print(_email);
      try {
        UserCredential user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: _email.toString(), password: _password.toString());

        FirebaseAuth.instance.authStateChanges().listen((Nuser) {
          if (Nuser != null) {
            FirebaseAuth.instance.currentUser!
                .updateDisplayName(_username)
                .then((value) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Dashboard()));
              try {
                firestore.collection('Users').add({
                  'ID': FirebaseAuth.instance.currentUser!.uid,
                  'Username': _username,
                  'Email': _email,
                  'Fidas ID': _fidas!.isEmpty ? 'Not Connected' : _fidas,
                  'Phone': _phone,
                  'Type': 'user'
                }).then((value) => print('user added to db'));
              } catch (e) {
                print(e);
              }
            });
          }
        });
      } on FirebaseAuthException catch (e) {
        print(e);
      }
    }
  }
}
