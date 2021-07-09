import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_worker/applications/applications.dart';
import 'package:student_worker/global/pages.dart';
import 'package:student_worker/global/successDialog.dart';
import 'package:student_worker/jobs/job.dart';
import 'package:student_worker/jobs/jobMain.dart';

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
        return Center(child: Text('Resume'));
      case profile:
        return Center(child: Text('Profile'));
      default:
        return Center(child: Text('Unknwon'));
    }
  }

  void onJobTap(JobModel job) {
    isFromJobs = true;
    navigator!.pushNamed(jobDescription);
  }

  void search() {}

  void onApplyTap() => navigator!.pushNamed(jobConfirm);

  void onFindMoreJobsTap() =>
      navigator!.pushNamedAndRemoveUntil(studentBaseWidget, (route) => false);

  void onConfirmApplication() {
    showDialog(
        context: navigator!.context,
        builder: (_) => ApplicationSuccess(
            message: 'Your application has been submitted!',
            actionTitle: 'Find more jobs',
            action: onFindMoreJobsTap));
  }
}
