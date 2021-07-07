import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'job.dart';
import 'jobProvider.dart';

class JobDescriptionMain extends StatefulWidget {
  @override
  _JobDescriptionMainstate createState() {
    return _JobDescriptionMainstate();
  }
}

class _JobDescriptionMainstate extends State<JobDescriptionMain> {
  Widget buildAbout() {
    return Text(
      'About Company',
      style: TextStyle(
        fontSize: 17,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildText1() {
    return Text(
      'Company is the fastest growing authentic directory that takes pride in connecting buyers and sellers across Nigeria and beyond. Our online outlet provides you with an uninterrupted shopping experience. ',
      style: TextStyle(
        fontSize: 16,
        color: Colors.black87,
      ),
    );
  }

  Widget buildText2() {
    return Text(
      'Responsibility Of Student',
      style: TextStyle(
        fontSize: 17,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildText3() {
    return Text(
      '1. Prepare and develop tools'
      '\n \n2. Lead the entire student team'
      '\n \n3. Utilize backend stuff'
      '\n \n4. Design and code learning',
      style: TextStyle(
        fontSize: 16,
        color: Colors.black87,
      ),
    );
  }

  Widget buildText4() {
    return Text(
      'Who can apply',
      style: TextStyle(
        fontSize: 17,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildText5() {
    return Text(
      'Candidates who:'
      '\n \n1. Available to work for duration of 3months'
      '\n \n2. Can resume work immediately'
      '\n \n3. Have relevant skills and interests'
      '\n \n4. Ready to learn',
      style: TextStyle(
        fontSize: 16,
        color: Colors.black87,
      ),
    );
  }

  Widget buildApplyBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.black87,
          elevation: 8,
        ),
        onPressed: context.read(jobProvider).onApplyTap,
        child: Text(
          'Apply',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildAppliedCard() {
    return Card(
      elevation: 8,
      color: Colors.black,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'Applied',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            JobWidget(JobModel()),
            SizedBox(height: 10),
            buildAbout(),
            SizedBox(height: 5),
            buildText1(),
            SizedBox(height: 10),
            buildText2(),
            SizedBox(height: 5),
            buildText3(),
            SizedBox(height: 10),
            buildText4(),
            SizedBox(height: 5),
            buildText5(),
            SizedBox(height: 10),
            context.read(jobProvider).isFromJobs
                ? buildApplyBtn()
                : buildAppliedCard(),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
