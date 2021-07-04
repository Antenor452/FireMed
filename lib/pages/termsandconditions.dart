import 'package:final_year_project_app/widgets/draweritems.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '';

class Terms extends StatelessWidget {
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
          backgroundColor: Colors.orange,
        ),
        drawer: DrawerItems(),
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(color: Color(0xFFE5E5E5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 12,
              ),
              Text(
                'Terms of Use',
                style: GoogleFonts.headlandOne(
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                child: Text(
                    'By downloading, browsing, accessing or using this mobile application FireMeds, you agree to be bomd by these Terms and Conditions of use. We reserve the right to amend these terms and conditions at any time, without any prior notice. However we will try our best to inform users of any update. All updates are effective immediately after been posted. We will notify users of any material changes to the Terms of Use via email. You are required to agree to the changes to the Terms of Use prior to further use of the FireMeds platform. If you disagree with any of these Terms and Conditions of use, you must immdiately discontine your access to this Mobile Application and your use of the services offered on the Mobile Application.Contined use of the FireMeds Mobile Application will constitute acceptance of these Terms and Conditions of Use. '),
              )
            ],
          ),
        ),
      ),
    );
  }
}
