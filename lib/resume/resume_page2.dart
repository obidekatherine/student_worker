import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_worker/global/my_text_field.dart';

import '../global/sp.dart';
import 'resume_provider.dart';

class ResumePage2 extends StatefulWidget {
  @override
  _ResumePage2State createState() => _ResumePage2State();
}

class _ResumePage2State extends State<ResumePage2> {
  @override
  void initState() {
    super.initState();
    context.read(resumeProvider).initPage2Controllers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xffE5E5E5),
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Create Your Resume',
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
        ),
        backgroundColor: Color(0xffE5E5E5),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 24.0,
              ),
              Text(
                'Education',
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  letterSpacing: 1,
                  color: Color(0xff000000),
                )),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                'University',
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xff000000),
                )),
              ),
              SizedBox(
                height: 3.0,
              ),
              MyTextField(
                  onChanged: (value) =>
                      context.read(resumeProvider).onChanged(studentSchoolKey, value),
                  controller: context.read(resumeProvider).schoolController,
                  hintText: "University Of Lagos",
                  keyboardType: TextInputType.name),
              SizedBox(
                height: 16.0,
              ),
              Text(
                'Course Of Study',
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xff000000),
                )),
              ),
              SizedBox(
                height: 3.0,
              ),
              MyTextField(
                  onChanged: (value) =>
                      context.read(resumeProvider).onChanged(studentCourseKey, value),
                  controller: context.read(resumeProvider).courseController,
                  hintText: 'Mechanical Engineering',
                  keyboardType: TextInputType.name),
              SizedBox(
                height: 16.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Start Year',
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color(0xff000000),
                            ))),
                        SizedBox(
                          height: 3,
                        ),
                        MyTextField(
                            onChanged: (value) => context
                                .read(resumeProvider)
                                .onChanged(studentStartYearKey, value),
                            controller: context
                                .read(resumeProvider)
                                .startYearController,
                            hintText: '2019',
                            keyboardType: TextInputType.text),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('End Year',
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color(0xff000000),
                            ))),
                        SizedBox(
                          height: 3.0,
                        ),
                        MyTextField(
                            onChanged: (value) => context
                                .read(resumeProvider)
                                .onChanged(studentEndYearKey, value),
                            controller:
                                context.read(resumeProvider).endYearController,
                            hintText: '2022',
                            keyboardType: TextInputType.number),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 74,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: ElevatedButton(
                      onPressed: context.read(resumeProvider).previousPage,
                      child: Text(
                        "Previous",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xff0A674F),
                          ),
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xffE5E5E5)),
                      ),
                    ),
                  ),
                  Spacer(flex: 2),
                  Expanded(
                    flex: 3,
                    child: ElevatedButton(
                      onPressed: context.read(resumeProvider).moveToPage3,
                      child: Text(
                        "Next",
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Color(0xffFFFFFF),
                        )),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xFF0A674F)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
