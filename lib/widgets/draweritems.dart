import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_year_project_app/pages/termsandconditions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../pages/login.dart';
import 'package:final_year_project_app/pages/dashboard.dart';
import 'package:final_year_project_app/pages/tipsspage.dart';

class DrawerItems extends StatelessWidget {
  String? uid = FirebaseAuth.instance.currentUser!.uid;
  late Future username;

  Future<String> getusername() async {
    Object? userdata = await FirebaseFirestore.instance
        .collection('Users')
        .where('uid', isEqualTo: uid)
        .get()
        .then((QuerySnapshot files) {
      if (files.docs.isEmpty) {
        print(files.docs[0].data());
      }
      return files.docs[0].get('Username');
    });
    print(userdata);

    return userdata.toString();
  }

  void launchURL() async {
    const url = 'https://www.gnfs.gov.gh/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
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
                        size: 70,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(FirebaseAuth.instance.currentUser!.email.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ))
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
            onTap: () {
              launchURL();
            },
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
            onTap: getusername,
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
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()));
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
