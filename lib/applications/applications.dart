import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_worker/jobs/jobProvider.dart';

import 'appliedJobsWidget.dart';

class Applications extends StatefulWidget {
  @override
  _ApplicationsState createState() => _ApplicationsState();
}

class _ApplicationsState extends State<Applications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: Text('My Applications', style: TextStyle()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: context.read(jobProvider).appliedJobList.isEmpty
            ? Center(child: Text('You have not applied for any job yet'))
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView(
                  children: context
                      .read(jobProvider)
                      .appliedJobList
                      .map((job) => AppliedJobWidget(job))
                      .toList(),
                ),
              ),
      ),
    );
  }
}
