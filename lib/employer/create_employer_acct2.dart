import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_worker/global/my_text_field.dart';

import '../global/sp.dart';
import 'employer_provider.dart';

class CreateEmployerAcct2 extends StatefulWidget {
  @override
  _ResumePage2State createState() => _ResumePage2State();
}

class _ResumePage2State extends State<CreateEmployerAcct2> {
  @override
  void initState() {
    super.initState();
    context.read(employerProvider).initPage2Controllers();
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
              SizedBox(
                height: 24.0,
              ),
              Text(
                'Organisation Details',
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
                'Name',
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
                  action: TextInputAction.next,
                  onChanged: (value) => context
                      .read(employerProvider)
                      .onChanged(employerCompanyNameKey, value),
                  controller:
                      context.read(employerProvider).companyNameController,
                  hintText: "Organisation name",
                  keyboardType: TextInputType.name),
              SizedBox(
                height: 16.0,
              ),
              Text(
                'Description',
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xff000000),
                )),
              ),
              SizedBox(height: 3.0),
              MyTextField(
                  action: TextInputAction.next,
                  maxLines: 5,
                  onChanged: (value) => context
                      .read(employerProvider)
                      .onChanged(employerDescriptionKey, value),
                  controller:
                      context.read(employerProvider).descriptionController,
                  hintText: 'A brief description about your company',
                  keyboardType: TextInputType.name),
              SizedBox(
                height: 16.0,
              ),
              Text(
                'Address',
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
                  action: TextInputAction.next,
                  onChanged: (value) => context
                      .read(employerProvider)
                      .onChanged(employerAddressKey, value),
                  controller: context.read(employerProvider).addressController,
                  hintText: '36 Adeola Odeku Street Victorial Island 100246',
                  keyboardType: TextInputType.name),
              SizedBox(height: 16),
              Text(
                'State',
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xff000000),
                )),
              ),
              SizedBox(height: 3.0),
              MyTextField(
                  action: TextInputAction.next,
                  onChanged: (value) => context
                      .read(employerProvider)
                      .onChanged(employerCurrentStateKey, value),
                  controller: context.read(employerProvider).stateController,
                  hintText: 'Lagos',
                  keyboardType: TextInputType.name),
              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: ElevatedButton(
                      onPressed: context.read(employerProvider).previousPage,
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
                  Spacer(
                    flex: 2,
                  ),
                  Expanded(
                    flex: 3,
                    child: ElevatedButton(
                      onPressed: context.read(employerProvider).moveToPostJob,
                      child: Text(
                        "Submit",
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          letterSpacing: 2,
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
