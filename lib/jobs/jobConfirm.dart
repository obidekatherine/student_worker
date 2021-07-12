import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_worker/global/sp.dart';

import 'jobProvider.dart';

class JobConfirm extends StatefulWidget {
  @override
  _JobConfirmstate createState() {
    return _JobConfirmstate();
  }
}

class _JobConfirmstate extends State<JobConfirm> {
  bool showMore = false;

  int currentNavIndex = 0;

  Widget buildBox() {
    return Container(
      //alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      height: 150,
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Applying for Job Title at Company? This is the resume the employer will see, make sure it is up to date',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          ElevatedButton(
            onPressed: context.read(jobProvider).onConfirmApplication,
            child: Text('Confirm'),
          ),
        ],
      ),
    );
  }

  Widget buildText1() {
    return Text(
      'Resume',
      style: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget buildText2() {
    return Text(
      'Personal details',
      style: TextStyle(
        fontSize: 17,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildText3() {
    return Text(
      '${SP.getString(studentFirstnameKey)} '
      '${SP.getString(studentLastnameKey)}',
      style: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildText4() {
    return Text(
      '${SP.getString(emailKey)}'
      '\n\n${SP.getString(studentMobileNumberKey)}'
      '\n\n${SP.getString(studentCityKey)}, ${SP.getString(studentCurrentStateKey)}',
      style: TextStyle(
        fontSize: 16,
        color: Colors.black87,
      ),
    );
  }

  Widget buildText5() {
    return Text(
      'Education',
      style: TextStyle(
        fontSize: 17,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildText6() {
    return Text(
      '${SP.getString(studentCourseKey)}',
      style: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildText7() {
    return Text(
      '${SP.getString(studentSchoolKey)}'
      '\n\n${SP.getString(studentStartYearKey)} - ${SP.getString(studentEndYearKey)}',
      style: TextStyle(
        fontSize: 16,
        color: Colors.black87,
      ),
    );
  }

  Widget buildText8() {
    return Text(
      'Skills',
      style: TextStyle(
        fontSize: 17,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildText9() {
    return Text(
      '1. ${SP.getString(studentSkill1Key)}'
      '\n\n2. ${SP.getString(studentSkill2Key)}'
      '\n\n3. ${SP.getString(studentSkill3Key)}',
      style: TextStyle(
        fontSize: 16,
        color: Colors.black87,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 80,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildBox(),
            SizedBox(height: 20),
            buildText1(),
            SizedBox(height: 30),
            buildText2(),
            SizedBox(height: 5),
            buildText3(),
            SizedBox(height: 5),
            buildText4(),
            SizedBox(height: 30),
            buildText5(),
            SizedBox(height: 5),
            buildText6(),
            SizedBox(height: 5),
            buildText7(),
            SizedBox(height: 30),
            buildText8(),
            SizedBox(height: 5),
            buildText9(),
          ],
        ),
      ),
    );
  }
}
