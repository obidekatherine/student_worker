import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffE5E5E5),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 70),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Color(0xff341F97),
                      child: Text(
                        'A',
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                          color: Color(0xffFFFFF9),
                        )),
                      ),
                      radius: 26,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Ayo David',
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Color(0xff000000),
                      )),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "ayodavid123@gmail.com",
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: Color(0xff000000),
                      )),
                    ),
                    SizedBox(
                      height: 19,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      
                      child: Text(
                        'Change Email',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Color(0xff000000),
                        )),
                      ),
                    ),
                    Divider(
                      height: 1,
                      color: Color(0xff341F97),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Change Password',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Color(0xff000000),
                      )),
                    ),
                    Divider(
                      height: 1,
                      color: Color(0xff341F97),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Settings',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Color(0xff000000),
                      )),
                    ),
                    Divider(
                      height: 1,
                      color: Color(0xff341F97),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Help',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Color(0xff000000),
                      )),
                    ),
                    Divider(
                      height: 1,
                      color: Color(0xff341F97),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Logout',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Color(0xff000000),
                      )),
                    ),
                    Divider(
                      height: 1,
                      color: Color(0xff341F97),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
