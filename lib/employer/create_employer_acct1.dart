import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:student_worker/general/my_text_field.dart';
import '../general/sp.dart';
import 'employer_provider.dart';

class CreateEmployerAcct1 extends StatefulWidget {
  @override
  _CreateEmployerAcct1State createState() => _CreateEmployerAcct1State();
}

class _CreateEmployerAcct1State extends State<CreateEmployerAcct1> {
  @override
  void initState() {
    super.initState();
    context.read(employerProvider).initPage1Controllers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffE5E5E5),
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Create Your Account',
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
                    .read(employerProvider)
                    .onChanged(employerFirstnameKey, value),
                controller: context.read(employerProvider).firstnameController,
                keyboardType: TextInputType.name,
                hintText: 'Daniel',
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
                      .read(employerProvider)
                      .onChanged(employerLastnameKey, value),
                  controller: context.read(employerProvider).lastnameController,
                  hintText: 'Silver',
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
                          .read(employerProvider)
                          .onChanged(employerCountryCodeKey, value),
                      controller:
                          context.read(employerProvider).countryCodeController,
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
                            .read(employerProvider)
                            .onChanged(employerMobileNumberKey, value),
                        controller: context
                            .read(employerProvider)
                            .mobileNumberController,
                        hintText: '8074000011',
                        keyboardType: TextInputType.number),
                  ),
                ],
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: context.read(employerProvider).movetToPage2,
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
