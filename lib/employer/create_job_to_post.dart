import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'employer_provider.dart';

class CreateJobToPost extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _CreateJobToPostState createState() => _CreateJobToPostState();
}

class _CreateJobToPostState extends State<CreateJobToPost> {
  int radioValue = 0;
  int locationValue = 0;

  @override
  void initState() {
    super.initState();
    radioValue = 0;
    locationValue = 0;
  }

  setradioValue(int val) {
    setState(() {
      radioValue = val;
    });
  }

  setlocationValue(int val) {
    setState(() {
      locationValue = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Create Job',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 12.0),
              SizedBox(height: 20.0),
              Text(
                'Type of Job',
                textAlign: TextAlign.start,
                style: GoogleFonts.lato(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Job Title',
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Category",
                style: GoogleFonts.lato(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Radio<int>(
                    value: 1,
                    groupValue: radioValue,
                    onChanged: (value) {
                      setradioValue(value!);
                    },
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text('Information technology'),
                ],
              ),
              Row(
                children: [
                  Radio<int>(
                    value: 2,
                    groupValue: radioValue,
                    onChanged: (value) {
                      setradioValue(value!);
                    },
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text('Marketing'),
                ],
              ),
              Row(
                children: [
                  Radio<int>(
                    value: 3,
                    groupValue: radioValue,
                    onChanged: (value) {
                      setradioValue(value!);
                    },
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text('Sales'),
                ],
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(
                "Location",
                style: GoogleFonts.lato(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Radio<int>(
                    value: 1,
                    groupValue: locationValue,
                    onChanged: (value) {
                      setlocationValue(value!);
                    },
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text('on-ground'),
                ],
              ),
              Row(
                children: [
                  Radio<int>(
                    value: 2,
                    groupValue: locationValue,
                    onChanged: (value) {
                      setlocationValue(value!);
                    },
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text('Remote'),
                ],
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(
                "Student Responsibility",
                style: GoogleFonts.lato(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(gapPadding: 4.0),
                  labelText: 'Student Responsibility',
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(
                "Salary(Fixed or Range)",
                style: GoogleFonts.lato(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 5.0),
                  ),
                  labelText: 'N20,000',
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(
                "Hours per week",
                style: GoogleFonts.lato(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 5.0),
                  ),
                  labelText: '24',
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(
                "Who Can apply? (Work duration and requirements)",
                style: GoogleFonts.lato(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 5.0),
                  ),
                  labelText: 'Candidates Eligibility to apply',
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              ElevatedButton(
                onPressed: context.read(employerProvider).goToReviewJob,
                child: Text('Next', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(primary: Colors.green[800]),
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
