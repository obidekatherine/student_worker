import 'package:flutter/material.dart';

import 'package:student_worker/jobDescriptionMain.dart';
import 'package:student_worker/jobSearchMain.dart';



void main() {
  runApp(StudentWorker());
}

class StudentWorker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false, 
    home: JobDescriptionMain(),
    );
  }
}
