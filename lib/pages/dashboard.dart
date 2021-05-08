import 'package:final_year_project_app/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.headlandOneTextTheme()),
      home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              'FIREMED',
              style: GoogleFonts.headlandOne(),
            ),
            centerTitle: true,
            backgroundColor: Colors.orange,
          ),
          drawer: Drawer(
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
                          height: 30,
                        ),
                        Text('Rahim Flash',
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
                  margin: EdgeInsets.only(top: 18, left: 18),
                  child: Text('Your activities',
                      style: TextStyle(color: Colors.black)),
                ),
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
                ),
                Divider(color: Colors.black),
                Container(
                  margin: EdgeInsets.only(top: 18, left: 18),
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
                ),
                ListTile(
                    title: Row(
                  children: [
                    Icon(Icons.lock_open),
                    SizedBox(
                      width: 18,
                    ),
                    Text('Privacy and Policy')
                  ],
                )),
                ListTile(
                  title: Row(
                    children: [
                      Icon(Icons.info),
                      SizedBox(
                        width: 18,
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
                        width: 18,
                      ),
                      Text('Feedback')
                    ],
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  title: Row(
                    children: [
                      Icon(Icons.logout),
                      SizedBox(
                        width: 18,
                      ),
                      Text('Logout')
                    ],
                  ),
                )
              ],
            ),
          ),
          body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomLeft,
                    colors: [Colors.red, Colors.orange])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: ClipOval(
                    child: InkWell(
                      onTap: () {
                        print('Alert');
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            gradient: RadialGradient(
                                colors: [Colors.red, Colors.blue])),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.fire_extinguisher,
                                  color: Colors.white),
                              Text(
                                'Alarm',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
