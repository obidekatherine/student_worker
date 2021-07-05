import 'package:flutter/material.dart';
import 'package:student_worker/job.dart';


import 'appliedJobs.dart';

class Applications extends StatefulWidget {
  @override
  _ApplicationsState createState() => _ApplicationsState();
}

class _ApplicationsState extends State<Applications> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [AppliedJobWidget(JobModel())],
      ),
    );
  }
}
