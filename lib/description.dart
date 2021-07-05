import 'package:flutter/material.dart';

class JobModel {
  String title, company, location, salary;
  int duration, numberOfApplicants, hoursPerWeek;

  JobModel({
    this.title = 'Job Title',
    this.company = 'Company',
    this.location = 'Location',
    this.duration = 10,
    this.numberOfApplicants = 12,
    this.hoursPerWeek = 24,
    this.salary = '20,000',
  });
}

class IconLabel extends StatelessWidget {
  final Widget icon;
  final String label;

  const IconLabel({this.icon = const Icon(Icons.location_on), this.label = ''});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        Text(
          label,
          // style: const TextStyle(
          //   fontWeight: FontWeight.bold,
          // ),
        ),
      ],
    );
  }
}

class JobWidget extends StatelessWidget {
  final JobModel job;
  const JobWidget(this.job);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
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
        Row(
          children: [
            IconLabel(icon: Icon(Icons.money), label: '#${job.salary}/mo'),
            SizedBox(width: 10),
            IconLabel(
                icon: Icon(Icons.access_time),
                label: '${job.hoursPerWeek}hrs/week'),
          ],
        ),
        SizedBox(height: 20),
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
                '',
                style: TextStyle(
                  color: Colors.black45,
                    decoration: TextDecoration.underline, fontSize: 12),
              ),
            ),
          ],
        ),
        Divider(
          thickness: 1.00,
          color: Colors.black54,
        ),
      ],
    );
  }
}
