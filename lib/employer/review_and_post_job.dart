import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'employer_provider.dart';

class ReviewAndPostJob extends StatefulWidget {
  @override
  _ReviewAndPostJobState createState() => _ReviewAndPostJobState();
}

class _ReviewAndPostJobState extends State<ReviewAndPostJob> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Post Job",
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
              fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 19.0, vertical: 0.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Job Title',
                textAlign: TextAlign.start,
                style: GoogleFonts.lato(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                'Company',
                textAlign: TextAlign.start,
                style: GoogleFonts.lato(fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Icon(Icons.location_on),
                  Text("Location"),
                  SizedBox(
                    width: 10.0,
                  ),
                  Icon(Icons.circle),
                  //SizedBox(width:5.0 ,),
                  Text('Information technology'),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Icon(Icons.money),
                  SizedBox(
                    width: 3.0,
                  ),
                  Text('N 20,000/month'),
                  SizedBox(
                    width: 5.0,
                  ),
                  Icon(Icons.timer),
                  SizedBox(
                    width: 3.0,
                  ),
                  Text('24hrs/week'),
                ],
              ),
              Divider(
                thickness: 2.0,
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                'About Company',
                style: GoogleFonts.lato(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                  'Company is the fastest-growing authentic directory that takes pride in connecting buyers and sellers across Nigeria and beyond. Our online outlet provides you with an uninterrupted shopping experience'),
              SizedBox(
                height: 12.0,
              ),
              Text(
                "Responsibility of Student",
                style: GoogleFonts.lato(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                  '1. Prepare and develop tools \n2. Lead the entire student team \n3. Utilize backend stuff \n4. Design and code electrothings'),
              SizedBox(
                height: 12.0,
              ),
              Text(
                "Who can Apply",
                style: GoogleFonts.lato(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text('Candidates who?'),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "1. Are available for work for a duration of 3months \n2. Can start work between June 20 and June 23 2021 \n3. Have relevant skills and interests \n4. Can cook stew",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 24.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green[800]),
                onPressed: context.read(employerProvider).onConfirmJobToPost,
                child: Text('Confirm'),
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
