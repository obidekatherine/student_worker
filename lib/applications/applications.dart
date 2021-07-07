import 'package:flutter/material.dart';
import 'package:student_worker/jobs/job.dart';

import 'appliedJobs.dart';

class Applications extends StatefulWidget {
  @override
  _ApplicationsState createState() => _ApplicationsState();
}

class _ApplicationsState extends State<Applications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text('My Applications', style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            AppliedJobWidget(JobModel()),
            Divider(),
            AppliedJobWidget(JobModel()),
            Divider(),
            AppliedJobWidget(JobModel()),
          ],
        ),
      ),
    );
  }
}
