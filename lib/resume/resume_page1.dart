import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_worker/global/my_text_field.dart';
import 'package:student_worker/resume/resume_provider.dart';

import '../global/sp.dart';

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
                onChanged: (value) => context
                    .read(resumeProvider)
                    .onChanged(studentFirstnameKey, value),
                controller: context.read(resumeProvider).firstnameController,
                keyboardType: TextInputType.name,
                hintText: 'Ayo',
                action: TextInputAction.next,
                focusNode: context.read(resumeProvider).firstnameNode,
                onEditingComplete: () => context
                    .read(resumeProvider)
                    .nextNode(context.read(resumeProvider).lastnameNode),
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
                    .onChanged(studentLastnameKey, value),
                controller: context.read(resumeProvider).lastnameController,
                hintText: 'David',
                keyboardType: TextInputType.name,
                action: TextInputAction.next,
                focusNode: context.read(resumeProvider).mobileNumberNode,
                onEditingComplete: () => context
                    .read(resumeProvider)
                    .nextNode(context.read(resumeProvider).lastnameNode),
              ),
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
                          .onChanged(studentCountryCodeKey, value),
                      controller:
                          context.read(resumeProvider).countryCodeController,
                      readOnly: true,
                      hintText: '+234',
                      keyboardType: TextInputType.number,
                      action: TextInputAction.next,
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
                          .onChanged(studentMobileNumberKey, value),
                      controller:
                          context.read(resumeProvider).mobileNumberController,
                      hintText: '8074000011',
                      keyboardType: TextInputType.number,
                      action: TextInputAction.next,
                      focusNode: context.read(resumeProvider).mobileNumberNode,
                      onEditingComplete: () => context
                          .read(resumeProvider)
                          .nextNode(
                              context.read(resumeProvider).stateNode),
                    ),
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
                              .onChanged(studentCurrentStateKey, value),
                          controller: context
                              .read(resumeProvider)
                              .currentStateController,
                          hintText: 'Lagos',
                          keyboardType: TextInputType.text,
                          action: TextInputAction.next,
                          focusNode: context.read(resumeProvider).stateNode,
                          onEditingComplete: () =>
                              context.read(resumeProvider).nextNode(context.read(resumeProvider).cityNode),
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
                              .onChanged(studentCityKey, value),
                          controller:
                              context.read(resumeProvider).cityController,
                          hintText: 'Apapa',
                          keyboardType: TextInputType.text,
                          action: TextInputAction.next,
                          focusNode: context.read(resumeProvider).cityNode,
                          onEditingComplete: () => context
                              .read(resumeProvider)
                              .nextNode(FocusNode()),
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
