import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_worker/global/sp.dart';

class StudentProfile extends StatefulWidget {
  const StudentProfile({Key? key}) : super(key: key);

  @override
  _StudentProfileState createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Profile'),
      ),
      backgroundColor: Color(0xffE5E5E5),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Color(0xff341F97),
                    child: Text(
                      '${SP.getString(studentFirstnameKey)!.substring(0, 1)}',
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
                    '${SP.getString(studentFirstnameKey)} ${SP.getString(studentLastnameKey)}',
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
                    "${SP.getString(emailKey)}",
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
    );
  }
}
