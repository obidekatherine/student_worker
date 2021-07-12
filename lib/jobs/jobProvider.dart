import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import 'package:student_worker/applications/applications.dart';
import 'package:student_worker/global/pages.dart';
import 'package:student_worker/global/successDialog.dart';
import 'package:student_worker/jobs/job.dart';
import 'package:student_worker/jobs/jobMain.dart';
import 'package:student_worker/profile/student_profile.dart';
import 'package:student_worker/resume/resume_edit.dart';

final jobProvider = ChangeNotifierProvider((ref) => JobProvider());

class JobProvider extends ChangeNotifier {
  bool showMore = false;

  bool pinned = true;
  bool snap = false;
  bool floating = false;

  static const int jobs = 0;
  static const int applications = 1;
  static const int resume = 2;
  static const int profile = 3;

  int currentNavIndex = 0;

  bool isFromJobs = true;

  bool loading = true;

  List<dynamic> jobList = [];
  List<JobModel> appliedJobList = [];

  JobModel job = JobModel();

  var searchController = TextEditingController();

  var filterDropdownValue = 'Lagos';

  var isRemote = true;

  var isOnsite = false;

  var filterList = [
    'Ikeja',
    'Lagos',
    'Ibadan',
    'Abuja',
    'Onitsha',
    'Calabar',
    'Ebonyi',
    'Ogun'
  ];

  void onNavItemTap(int i) {
    currentNavIndex = i;
    notifyListeners();
  }

  Widget selectScreen() {
    switch (currentNavIndex) {
      case jobs:
        return JobMain();
      case applications:
        return Applications();
      case resume:
        return ResumeEdit();
      case profile:
        return StudentProfile();
      default:
        return Center(child: Text('Unknwon'));
    }
  }

  void onJobTap(JobModel job) {
    isFromJobs = true;
    notifyListeners();
    navigator!.pushNamed(jobDescription);
  }

  void search() async {
    if (searchController.text.isEmpty) return fetchJobs();
    FocusScope.of(navigator!.context).requestFocus(FocusNode());
    loading = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));
    jobList = jobList
        .where((job) => job.title
            .toLowerCase()
            .contains(searchController.text.toLowerCase()))
        .toList();
    loading = false;
    notifyListeners();
  }

  void fetchJobs() async {
    debugPrint('start');
    loading = true;
    notifyListeners();
    http.Response res = await http
        .get(Uri.parse('https://student-worker2.herokuapp.com/search'));
    debugPrint(res.body);
    debugPrint('working');
    Map<String, dynamic> data = jsonDecode(res.body);
    // debugPrint(data.toString());
    debugPrint('end');
    loading = false;
    jobList = data['jobs']!.map((job) => JobModel.fromJson(job)).toList();
    jobList.shuffle();
    notifyListeners();
  }

  void onApplyTap() => navigator!.pushNamed(jobConfirm);

  void onFindMoreJobsTap() =>
      navigator!.pushNamedAndRemoveUntil(studentBaseWidget, (route) => false);

  void onConfirmApplication() {
    appliedJobList.add(job);
    showDialog(
        context: navigator!.context,
        builder: (_) => ApplicationSuccess(
            message: 'Your application has been submitted!',
            actionTitle: 'Find more jobs',
            action: onFindMoreJobsTap));
  }

  void goToJobDescription(JobModel job) {
    this.job = job;
    navigator!.pushNamed(jobDescription, arguments: job);
  }

  String addFilterParam() {
    if (isRemote)
      return '&jobType=remote';
    else
      return '&jobType=on-site';
  }

  void applyFilter() async {
    navigator!.pop();
    debugPrint('start');
    loading = true;
    notifyListeners();
    http.Response res =
        await http.get(Uri.parse('https://student-worker2.herokuapp.com/search?'
            'location=$filterDropdownValue${addFilterParam()}'));
    debugPrint(res.body);
    debugPrint('working');
    Map<String, dynamic> data = jsonDecode(res.body);
    // debugPrint(data.toString());
    debugPrint('end');
    loading = false;
    jobList = data['jobs']!.map((job) => JobModel.fromJson(job)).toList();
    jobList.shuffle();
    notifyListeners();
  }

  void onLocationChanged(newValue) {
    filterDropdownValue = newValue;
    notifyListeners();
  }

  void onRemoteChanged(newValue) {
    isRemote = newValue;
    isOnsite = !newValue;
    notifyListeners();
  }

  void onOnsiteChanged(newValue) {
    isOnsite = newValue;
    isRemote = !newValue;
    notifyListeners();
  }
}
