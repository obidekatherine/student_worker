import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResumeEdit extends StatefulWidget {
  const ResumeEdit({Key? key}) : super(key: key);

  @override
  _ResumeEditState createState() => _ResumeEditState();
}

class _ResumeEditState extends State<ResumeEdit> {
  late SharedPreferences sp;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((value) => sp = value);
  }

  void onChanged(key, value) => sp.setString(key, value);

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:
              const EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 0),
          child: Column(
            children: [
              Center(
                child: Text('Resume',
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Color(0xff000000),
                    ))),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Personal Details',
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xff000000),
                          ))),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Ayo David',
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color(0xff000000),
                          ))),
                      SizedBox(
                        height: 3,
                      ),
                      Text('ayodavid123@gmail.com',
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xff000000),
                          ))),
                      SizedBox(
                        height: 3,
                      ),
                      Text('0903457862',
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xff000000),
                          ))),
                      SizedBox(
                        height: 3,
                      ),
                      Text('Apapa, Lagos',
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xff000000),
                          ))),
                      SizedBox(
                        height: 3,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  IconButton(
                    onPressed: () {
                      Alert(
                          context: context,
                          title: "Personal Details",
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'First Name',
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
                                      onChanged("Firstname", value),
                                  hintText: "Ayo",
                                  keyboardType: TextInputType.name),
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
                                  onChanged: (value) =>
                                      onChanged("Last name", value),
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
                                    flex: 2,
                                    child: MyTextField(
                                      onChanged: (value) =>
                                          onChanged("countryCode", value),
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
                                        onChanged: (value) =>
                                            onChanged("number", value),
                                        hintText: '8074000011',
                                        keyboardType: TextInputType.number),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                            onChanged: (value) => onChanged(
                                                "Current State", value),
                                            hintText: 'Lagos',
                                            keyboardType: TextInputType.text),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                            onChanged: (value) =>
                                                onChanged("City", value),
                                            hintText: 'Apapa',
                                            keyboardType: TextInputType.number),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          buttons: [
                            DialogButton(
                              child: Text('UPDATE',
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Color(0xffFFFFFF),
                                  ))),
                              color: Color(0xFF0A674F),
                              onPressed: () => Navigator.pop(
                                context,
                              ),
                            ),
                          ]).show();
                    },
                    icon: Icon(Icons.edit),
                    color: Colors.black,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Education',
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xff000000),
                          ))),
                      SizedBox(
                        height: 10,
                      ),
                      Text('University Of Lagos',
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color(0xff000000),
                          ))),
                      SizedBox(
                        height: 3,
                      ),
                      Text('Mechanical Engineering',
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xff000000),
                          ))),
                      SizedBox(
                        height: 3,
                      ),
                      Text('2019-2022',
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xff000000),
                          ))),
                      SizedBox(
                        height: 3,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  IconButton(
                    onPressed: () {
                      Alert(
                          context: context,
                          title: "Education",
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
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
                                      onChanged("school", value),
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
                                      onChanged("course", value),
                                  hintText: 'Mechanical Engineering',
                                  keyboardType: TextInputType.name),
                              SizedBox(
                                height: 16.0,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                            onChanged: (value) =>
                                                onChanged("startyear", value),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                            onChanged: (value) =>
                                                onChanged("endyear", value),
                                            hintText: '2022',
                                            keyboardType: TextInputType.number),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          buttons: [
                            DialogButton(
                              child: Text('UPDATE',
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Color(0xffFFFFFF),
                                  ))),
                              color: Color(0xFF0A674F),
                              onPressed: () => Navigator.pop(
                                context,
                              ),
                            ),
                          ]).show();
                    },
                    icon: Icon(Icons.edit),
                    color: Colors.black,
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Skills',
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xff000000),
                          ))),
                      SizedBox(
                        height: 10,
                      ),
                      Text('1. Graphic Design',
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color(0xff000000),
                          ))),
                      SizedBox(
                        height: 3,
                      ),
                      Text('2. Communication Skills ',
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xff000000),
                          ))),
                      SizedBox(
                        height: 3,
                      ),
                      Text('3. Teamwork',
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xff000000),
                          ))),
                      SizedBox(
                        height: 3,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () {
                        Alert(
                            context: context,
                            title: "Skills",
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
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
                                    onChanged: (value) =>
                                        onChanged("skill1", value),
                                    hintText: "Graphic Design",
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
                                    onChanged: (value) =>
                                        onChanged("skill2", value),
                                    hintText: 'Communication Skills',
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
                                    onChanged: (value) =>
                                        onChanged("skill3", value),
                                    hintText: 'Teamwork',
                                    keyboardType: TextInputType.name),
                              ],
                            ),
                            buttons: [
                              DialogButton(
                                child: Text('UPDATE',
                                    style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Color(0xffFFFFFF),
                                    ))),
                                color: Color(0xFF0A674F),
                                onPressed: () => Navigator.pop(
                                  context,
                                ),
                              ),
                            ]).show();
                      },
                      icon: Icon(Icons.edit),
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// this widget holds all field properties for this form
class MyTextField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final void Function(String) onChanged;
  final bool readOnly;
  //final TextEditingController? controller;

  MyTextField({
    Key? key,
    this.hintText = '',
    this.keyboardType = TextInputType.text,
    required this.onChanged,
    this.readOnly = false,
    // required this.controller,
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
