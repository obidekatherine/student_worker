import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:student_worker/filterDialog.dart';

class JobConfirm extends StatefulWidget {
  final void Function() findMoreJobs;

  JobConfirm(this.findMoreJobs);

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
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) => ApplicationSuccess(widget.findMoreJobs));
            },
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
      'Ayo David',
      style: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildText4() {
    return Text(
      'Ayodavid123@gmail.com'
      '\n\n09012345678'
      '\n\nApapa, Lagos',
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
      'Mechanical Engineering',
      style: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildText7() {
    return Text(
      'University Of Lagos'
      '\n\n2019 - 2022',
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
      '1. Graphic design'
      '\n\n2. Communication skill'
      '\n\n3. Teamwork',
      style: TextStyle(
        fontSize: 16,
        color: Colors.black87,
      ),
    );
  }

  void onNavItemTap(int i) {
    // Add a switch case statement here to perfom
    // some action for a perticular item
    setState(() {
      currentNavIndex = i;
    });
  }

/*Widget buildText3() {
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
  }*/

/*Widget buildText4() {
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
        onPressed: () => print("Login Pressed"),
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
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onNavItemTap,
        currentIndex: currentNavIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.work_outline), label: 'Jobs'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined), label: 'Applications'),
          BottomNavigationBarItem(
              icon: Icon(Icons.file_copy_outlined), label: 'Resume'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_pin), label: 'Profile'),
        ],
      ),
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
