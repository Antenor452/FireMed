import 'package:final_year_project_app/widgets/draweritems.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TipsPage extends StatefulWidget {
  @override
  _TipsPageState createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {
  double height = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.headlandOneTextTheme()),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Tips and Tricks',
            style: GoogleFonts.headlandOne(),
          ),
          centerTitle: true,
          backgroundColor: Colors.orange,
        ),
        drawer: DrawerItems(),
        body: Container(
          child: ListView(
            children: [
              CardView('Top tips and tricks', [
                Text(
                    '1.Install smoke alarms on every level of your home, inside bedrooms and outside sleeping areas.'),
                SizedBox(
                  height: 10,
                ),
                Text(
                    '2.Test FiDAS every year to see if it is working. If it isn’t, call for maintenance.'),
                SizedBox(
                  height: 10,
                ),
                Text(
                    '3.Keep fire exinguisher in key areas such as the kitchen, bedrooms, workshop, and garage.'),
                SizedBox(
                  height: 10,
                ),
                Text(
                    '4.Talk with all family members about a fire escape plan and practice the plan twice a year.'),
                SizedBox(
                  height: 10,
                ),
              ]),
              CardView('What to do if there is a fire', [
                Text('1.Know how to safely operate a fire extinguisher.'),
                SizedBox(
                  height: 10,
                ),
                Text(
                    '2.Remember to GET OUT, STAY OUT and CALL 9-1-1 or your local emergency phone number.'),
                SizedBox(
                  height: 10,
                ),
                Text(
                    '3.Yell "Fire!" several times and go outside right away. If you live in a building with elevators, use the stairs. Leave all your things where they are and save'),
                SizedBox(
                  height: 10,
                ),
                Text(
                    '4. If smoke, heat or flames block your exit routes, stay in the room with doors closed. Place a wet towel under the door and call the fire department or 9-1-1.'),
                SizedBox(
                  height: 10,
                )
              ]),
              CardView('Safe Equipments', [
                Text('1. Fire Detection and Alert System (FiDAS).'),
                SizedBox(
                  height: 10,
                ),
                Text('2. Fire Extinguishers.'),
                SizedBox(
                  height: 10,
                ),
                Text('3. Smoke Alarms.'),
                SizedBox(
                  height: 10,
                ),
                Text('4. Sprinklers.'),
                SizedBox(
                  height: 10,
                ),
                Text('5. Carbon Monoxide Alarm'),
                SizedBox(
                  height: 10,
                ),
              ]),
              CardView('Safety Precautions', [
                Text(
                    '1.Install smoke alarms on every level of your home, inside bedrooms and outside sleeping areas.'),
                SizedBox(
                  height: 10,
                ),
                Text(
                    '2.Keep ignition sources away from combustible material or flammable liquids and gases.'),
                SizedBox(
                  height: 10,
                ),
                Text(
                    '3.Keep use of flammable liquids to a minimum and close containers when not in use'),
                SizedBox(
                  height: 10,
                ),
                Text(
                    '4.If a fire occurs in your home, GET OUT, STAY OUT and CALL FOR HELP. Never go back inside for anything or anyone.'),
                SizedBox(
                  height: 10,
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

class CardView extends StatelessWidget {
  String title;
  List<Widget> items;
  CardView(this.title, this.items);
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
          width: double.infinity,
          child: ExpansionTile(
            title: Text(title),
            textColor: Colors.black,
            iconColor: Colors.black,
            children: items,
            childrenPadding: EdgeInsets.symmetric(horizontal: 12),
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
          ),
        ));
  }
}
