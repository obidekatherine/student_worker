import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_worker/resume/resume_provider.dart';

import '../sp.dart';
import 'resumepage2.dart';

class ResumePage1 extends StatefulWidget {
  @override
  _ResumePage1State createState() => _ResumePage1State();
}

class _ResumePage1State extends State<ResumePage1> {
  @override
  void initState() {
    super.initState();
    context.read(resumeProvider).initPage1Controllers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              SizedBox(height: 24.0),
              Text(
                'Personal Details',
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  color: Color(0xff000000),
                )),
              ),
              SizedBox(height: 16.0),
              Text(
                'First name',
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              SizedBox(
                height: 3.0,
              ),
              MyTextField(
                onChanged: (value) =>
                    context.read(resumeProvider).onChanged(firstnameTag, value),
                controller: context.read(resumeProvider).firstnameController,
                keyboardType: TextInputType.name,
                hintText: 'Ayo',
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                'Last name',
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
                      .onChanged(lastnameTag, value),
                  controller: context.read(resumeProvider).lastnameController,
                  hintText: 'David',
                  keyboardType: TextInputType.name),
              SizedBox(
                height: 16.0,
              ),
              Text(
                'Mobile number',
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
              Row(
                children: [
                  Expanded(
                    child: MyTextField(
                      onChanged: (value) => context
                          .read(resumeProvider)
                          .onChanged(countryCodeTag, value),
                      controller:
                          context.read(resumeProvider).countryCodeController,
                      readOnly: true,
                      hintText: '+234',
                      keyboardType: TextInputType.number,
                      //  controller: ctyCodeCtrn,
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    flex: 3,
                    child: MyTextField(
                        onChanged: (value) => context
                            .read(resumeProvider)
                            .onChanged(mobileNumberTag, value),
                        controller:
                            context.read(resumeProvider).mobileNumberController,
                        hintText: '8074000011',
                        keyboardType: TextInputType.number),
                  ),
                ],
              ),
              SizedBox(
                height: 16.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Current State',
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
                              .onChanged(currentStateTag, value),
                          controller: context
                              .read(resumeProvider)
                              .currentStateController,
                          hintText: 'Lagos',
                          keyboardType: TextInputType.text,
                          //controller: stateCtrn,
                        ),
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
                        Text('City',
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
                              .onChanged(cityTag, value),
                          controller:
                              context.read(resumeProvider).cityController,
                          hintText: 'Apapa',
                          keyboardType: TextInputType.text,
                          //controller: cityCtrn,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: context.read(resumeProvider).movetToPage2,
                child: Text(
                  "Next",
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      letterSpacing: 2,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFF0A674F)),
                ),
              ),
            ],
          ),
        ));
  }
}

// this widget holds all field properties for this form
class MyTextField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final void Function(String) onChanged;
  final bool readOnly;
  final TextEditingController? controller;

  MyTextField({
    Key? key,
    this.hintText = '',
    this.keyboardType = TextInputType.text,
    required this.onChanged,
    this.readOnly = false,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      readOnly: readOnly,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black38, width: 2.0)),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 5.0)),
        hintText: hintText,
      ),
      keyboardType: TextInputType.text,
    );
  }
}
