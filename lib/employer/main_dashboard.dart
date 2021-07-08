import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        //title: Text('Home'),
        leading: Padding(
          padding: EdgeInsets.only(
            left: 18.0,
            top: 12.0,
            bottom: 12.0,
            right: 12.0,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 19.0, vertical: 0.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 12.0,
              ),
              Center(
                child: Text(
                  "Dashboard",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
              Divider(
                thickness: 2.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Job Title',
                textAlign: TextAlign.start,
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  Text("Status:"),
                  SizedBox(
                    width: 10.0,
                  ),
                  //SizedBox(width:5.0 ,),
                  Text(
                    'Posted',
                    style: GoogleFonts.lato(),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 24.0,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Review job Post'),
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
