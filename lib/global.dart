import 'package:flutter/material.dart';
import 'package:student_worker/baseWidget.dart';
import 'package:student_worker/jobs/jobConfirm.dart';
import 'package:student_worker/jobs/jobDescriptionMain.dart';
import 'package:student_worker/onboarding/onboarding_page.dart';
import 'package:student_worker/resume/resumepage1.dart';
import 'package:student_worker/splash/splash_screen.dart';

import 'resume/resumepage2.dart';
import 'resume/resumepage3.dart';

// the global navigator key
final navigatorKey = GlobalKey<NavigatorState>();
final navigator = navigatorKey.currentState;

// a list of all the pages in the app
final loading = '/';
final baseWidget = 'baseWidget';
final jobDescription = 'jobDescription';
final jobConfirm = 'jobConfirm';
final onBoarding = 'onBoarding';
final resumePage1 = 'resumePage1';
final resumePage2 = 'resumePage2';
final resumePage3 = 'resumePage3';

// a map of all the pages in the app
final Map? pages = <String, Widget Function(BuildContext)?>{
  loading: (_) => SplashScreen(),
  onBoarding: (_) => OnBoardingScreen(),
  resumePage1: (_) => ResumePage1(),
  resumePage2: (_) => ResumePage2(),
  resumePage3: (_) => ResumePage3(),
  baseWidget: (_) => BaseWidget(),
  jobDescription: (_) => JobDescriptionMain(),
  jobConfirm: (_) => JobConfirm()
};
