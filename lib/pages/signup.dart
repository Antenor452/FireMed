import 'package:final_year_project_app/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailcon = TextEditingController();
  TextEditingController phonecon = TextEditingController();
  TextEditingController passcon = TextEditingController();
  var emailValid;

  Function validateEmail(String value) {
    setState(() {
      emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value);
    });
    print(emailValid);
  }

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
                Text('Create an account',
                    style: GoogleFonts.headlandOne(
                        fontSize: 18, color: Colors.white)),
                SizedBox(
                  height: 18,
                ),
                Container(
                  width: 330,
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle:
                            GoogleFonts.headlandOne(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.white,
                        )),
                    style: GoogleFonts.headlandOne(color: Colors.white),
                    controller: emailcon,
                    keyboardType: TextInputType.emailAddress,
                    onSubmitted: (emailcon) {
                      validateEmail(emailcon);
                    },
                  ),
                ),
                Container(
                  width: 330,
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle:
                            GoogleFonts.headlandOne(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.vpn_key,
                          color: Colors.white,
                        )),
                    style: GoogleFonts.headlandOne(color: Colors.white),
                  ),
                ),
                Container(
                  width: 330,
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: 'Phone Number',
                        labelStyle:
                            GoogleFonts.headlandOne(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Colors.white,
                        )),
                    style: GoogleFonts.headlandOne(color: Colors.white),
                    keyboardType: TextInputType.phone,
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
                  onTap: () {},
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
            )),
      ),
    );
  }
}
