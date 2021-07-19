import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_year_project_app/main.dart';
import 'package:final_year_project_app/pages/termsandconditions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../pages/login.dart';
import 'package:final_year_project_app/pages/dashboard.dart';
import 'package:final_year_project_app/pages/tipsspage.dart';

class DrawerItems extends StatelessWidget {
  Future<void> _signOut(context) async {
    Navigator.of(context).pop();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Login()),
        (Route<dynamic> route) => false);
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    var cuser = FirebaseAuth.instance.currentUser?.displayName;
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipOval(
                    child: Container(
                      color: Colors.white,
                      child: Icon(
                        FontAwesomeIcons.userCircle,
                        size: 50,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                      child: Text(
                    cuser.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  )),
                ],
              ),
            ),
            decoration: BoxDecoration(color: Colors.orangeAccent),
          ),
          Container(
            margin: EdgeInsets.only(top: 12, left: 18),
            child:
                Text('Your activities', style: TextStyle(color: Colors.black)),
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.home),
                SizedBox(
                  width: 15,
                ),
                Text('Dashboard')
              ],
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Dashboard()));
            },
          ),
          Divider(color: Colors.black),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.book),
                SizedBox(
                  width: 15,
                ),
                Text('Tips and tricks')
              ],
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => TipsPage()));
            },
          ),
          Divider(color: Colors.black),
          Container(
            margin: EdgeInsets.only(top: 12, left: 18),
            child: Text('Useful'),
          ),
          ListTile(
            title: Row(
              children: [
                Icon(FontAwesomeIcons.fire),
                SizedBox(
                  width: 15,
                ),
                Text('Fire Service Website')
              ],
            ),
          ),
          Divider(color: Colors.black),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.print),
                SizedBox(
                  width: 15,
                ),
                Text('Terms and Conditions')
              ],
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Terms()));
            },
          ),
          ListTile(
              title: Row(
            children: [
              Icon(Icons.lock_open),
              SizedBox(
                width: 15,
              ),
              Text('Privacy and Policy')
            ],
          )),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.info),
                SizedBox(
                  width: 15,
                ),
                Text('About')
              ],
            ),
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.feedback),
                SizedBox(
                  width: 15,
                ),
                Text('Feedback')
              ],
            ),
          ),
          ListTile(
            onTap: () async {
              Navigator.of(context).pop();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Login()),
                  (route) => false);
              await FirebaseAuth.instance.signOut();
            },
            title: Row(
              children: [
                Icon(Icons.logout),
                SizedBox(
                  width: 15,
                ),
                Text('Logout')
              ],
            ),
          )
        ],
      ),
    );
  }
}
