import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FireAuth = FirebaseAuth.instance.currentUser;
  String? _username;
  String? _email;
  String? _phone;
  String? _fidas;
  String? _password;
  bool hidepassword = true;
  var userdet;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdet();
  }

  void getdet() async {
    try {
      var userdet = await FirebaseFirestore.instance
          .collection('Users')
          .where('Email', isEqualTo: _email)
          .get();
      print(userdet.docs.first);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FIREMED',
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFFF5C00),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Color(0xFFE5E5E5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text(
                'Update user details or add a Fidas Id',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFFFF5C00),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Form(
                child: Column(
              children: [
                Container(
                  width: 330,
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                      labelText: 'Email :' + FireAuth!.email.toString(),
                      labelStyle: TextStyle(
                        color: Color(0xFFFF5C00),
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color(0xFFFF5C00),
                      ),
                    ),
                    style: TextStyle(color: Color(0xFFFF5C00)),
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
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                      labelText:
                          'Username :' + FireAuth!.displayName.toString(),
                      labelStyle: TextStyle(
                        color: Color(0xFFFF5C00),
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Color(0xFFFF5C00),
                      ),
                    ),
                    style: TextStyle(
                      color: Color(0xFFFF5C00),
                    ),
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
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                      labelText: 'Phone :',
                      labelStyle: TextStyle(
                        color: Color(0xFFFF5C00),
                      ),
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Color(0xFFFF5C00),
                      ),
                    ),
                    style: TextStyle(
                      color: Color(0xFFFF5C00),
                    ),
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
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                      labelText: 'Fidas ID :Please connect your fidas device',
                      labelStyle: TextStyle(
                        color: Color(0xFFFF5C00),
                      ),
                      prefixIcon: Icon(
                        Icons.important_devices,
                        color: Color(0xFFFF5C00),
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
              ],
            )),
            SizedBox(
              height: 12,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: 330,
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: Color(0xFFFF5C00),
                    borderRadius: BorderRadius.circular(25)),
                child: Center(
                  child: Text(
                    'UPDATE DETAILS',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
