import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_worker/applications/applicationProvider.dart';

import 'package:student_worker/jobs/job.dart';

class AppliedJobWidget extends StatelessWidget {
  final JobModel job;
  const AppliedJobWidget(this.job);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: context.read(applicationProvider).onAppliedJobTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(job.title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text(job.company),
          SizedBox(height: 15),
          Row(
            children: [
              Text('Status:'),
              Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Applied'),
                  ),
                  color: Colors.grey)
            ],
          ),
          SizedBox(height: 15),
          Row(children: [
            IconLabel(
                icon: Icon(Icons.people_outline_outlined),
                label: job.numberOfApplicants.toString()),
            SizedBox(width: 10),
            IconLabel(
                icon: Icon(Icons.calendar_today), label: 'You applied today'),
          ]),
        ],
      ),
    );
  }
}
