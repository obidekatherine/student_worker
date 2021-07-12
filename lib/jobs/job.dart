import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'jobProvider.dart';

class JobModel {
  String title,
      location,
      hrsPerWeek,
      salary,
      companyName,
      jobType,
      dateCreated,
      aboutCompany,
      studentResposibility;

  JobModel({
    this.title = 'Job Title',
    this.location = 'Location',
    this.hrsPerWeek = '24',
    this.salary = '20,000',
    this.companyName = 'Gagner',
    this.jobType = 'remote',
    this.dateCreated = '2',
    this.aboutCompany = 'Please visit our website to know more about us.',
    this.studentResposibility =
        'Please visit our website to know what you\'ll be doing',
  });

  factory JobModel.fromJson(json) {
    return JobModel(
      title: json['title'] ?? 'Node.js Developer at Gagner Unilag',
      companyName: json['companyName'],
      location: json['location'],
      jobType: json['jobType'],
      salary: json['salary'],
      hrsPerWeek: json['hrsPerWeek'],
      dateCreated: json['dateCreated'] ?? '3',
      aboutCompany: json['aboutCompany'] ??
          'Please visit our website to know more about us.',
      studentResposibility: json['studentResposibility'] ??
          'Please visit our website to know what you\'ll be doing',
    );
  }

  int numberOfApplicants() => Random().nextInt(20) + 1;
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
        SizedBox(width: 10),
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
        Divider(thickness: 2),
        SizedBox(height: 10),
        Text(job.title, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text(job.companyName),
        SizedBox(height: 15),
        Row(children: [
          IconLabel(icon: Icon(Icons.location_on), label: job.location),
          SizedBox(width: 10),
          IconLabel(
              icon: Icon(Icons.radio_button_checked), label: '${job.jobType}'),
        ]),
        SizedBox(height: 10),
        Row(
          children: [
            IconLabel(icon: Icon(Icons.money), label: '#${job.salary}/mo'),
            SizedBox(width: 10),
            IconLabel(
                icon: Icon(Icons.access_time),
                label: '${job.hrsPerWeek}hrs/week'),
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
              '${job.dateCreated} days ago - '
              '${job.numberOfApplicants()} applicants',
              style: TextStyle(fontSize: 12),
            ),
            TextButton(
              onPressed: () =>
                  context.read(jobProvider).goToJobDescription(job),
              child: Text(
                'view details',
                style: TextStyle(
                    color: Colors.black45,
                    decoration: TextDecoration.underline,
                    fontSize: 12),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
