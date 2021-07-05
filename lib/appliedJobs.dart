import 'package:flutter/material.dart';
import 'package:student_worker/job.dart';


class AppliedJobWidget extends StatelessWidget {
  final JobModel job;
  const AppliedJobWidget(this.job);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Divider(),
        Text(job.title, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text(job.company),
        SizedBox(height: 15),
        Row(children: [
          IconLabel(icon: Icon(Icons.location_on), label: job.location),
          SizedBox(width: 10),
          IconLabel(icon: Icon(Icons.radio_button_checked), label: 'Remote'),
        ]),
        SizedBox(height: 10),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(height: 2, width: 50, color: Colors.black),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${job.duration} days ago - '
              '${job.numberOfApplicants} applicants',
              style: TextStyle(fontSize: 12),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'View Details',
                style: TextStyle(
                    decoration: TextDecoration.underline, fontSize: 12),
              ),
            ),
          ],
        )
      ],
    );
  }
}








