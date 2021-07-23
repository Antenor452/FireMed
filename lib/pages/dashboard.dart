import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_year_project_app/pages/login.dart';
import 'package:final_year_project_app/widgets/draweritems.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String? fidasid;
  bool? isConnected;
  var docRef = FirebaseFirestore.instance.collection('Users');
  void getdata() async {
    var data = await docRef.where('Username', isEqualTo: 'Beansgh').get();

    print(data.size);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.headlandOneTextTheme()),
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              'FIREMED',
              style: GoogleFonts.headlandOne(),
            ),
            centerTitle: true,
            backgroundColor: Color(0xFFFF5C00),
          ),
          drawer: DrawerItems(),
          body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage('images/firebackground.jpg'),
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.dstATop),
                  fit: BoxFit.cover,
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Column(children: [
                    Text(
                      ' Fidas Status',
                      style: TextStyle(color: Colors.white),
                    ),
                    Container(
                      width: 50,
                      height: 10,
                      decoration: BoxDecoration(color: Colors.red),
                    )
                  ]),
                ),
                SizedBox(
                  height: 18,
                ),
                Container(
                  child: ClipOval(
                    child: InkWell(
                      onTap: () {
                        print('Alert');
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(color: Colors.red),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: Icon(
                                  FontAwesomeIcons.bell,
                                  color: Colors.white,
                                  size: 36,
                                ),
                              ),
                              Container(
                                child: Text(
                                  'Alarm',
                                  style: GoogleFonts.headlandOne(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
