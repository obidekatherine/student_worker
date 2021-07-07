import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_worker/baseWidget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../sp.dart';
import 'resume_provider.dart';
import 'resumepage2.dart';
import 'resumepage1.dart';

class ResumePage3 extends StatefulWidget {
  @override
  _ResumePage2State createState() => _ResumePage2State();
}

class _ResumePage2State extends State<ResumePage3> {
  @override
  void initState() {
    super.initState();
    context.read(resumeProvider).initPage3Controllers();
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
                'Skills',
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
                'Skill 1',
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
                  onChanged: (value) => context
                      .read(resumeProvider)
                      .onChanged(skill1Tag, value),
                  controller: context.read(resumeProvider).skill1Controller,
                  hintText: "skill1",
                  keyboardType: TextInputType.name),
              SizedBox(
                height: 16.0,
              ),
              Text(
                'Skill 2',
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
                  onChanged: (value) => context
                      .read(resumeProvider)
                      .onChanged(skill2Tag, value),
                  controller: context.read(resumeProvider).skill2Controller,
                  hintText: 'Communication skills',
                  keyboardType: TextInputType.name),
              SizedBox(
                height: 16.0,
              ),
              Text(
                'Skill 3',
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
                  onChanged: (value) => context
                      .read(resumeProvider)
                      .onChanged(skill3Tag, value),
                  controller: context.read(resumeProvider).skill3Controller,
                  hintText: 'Teamwork',
                  keyboardType: TextInputType.name),
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
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xffE5E5E5)),
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Expanded(
                    flex: 3,
                    child: ElevatedButton(
                      onPressed:
                          context.read(resumeProvider).moveToBaseWidget,
                      child: Text(
                        "Next",
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          letterSpacing: 2,
                          color: Color(0xffFFFFFF),
                        )),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xFF0A674F)),
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
