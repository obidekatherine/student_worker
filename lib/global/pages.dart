import 'package:flutter/material.dart';
import 'package:student_worker/applications/appliedJobDescription.dart';
import 'package:student_worker/auth/login.dart';
import 'package:student_worker/auth/signup.dart';
import 'package:student_worker/employer/create_employer_acct1.dart';
import 'package:student_worker/employer/create_employer_acct2.dart';
import 'package:student_worker/employer/employer_base_widget.dart';
import 'package:student_worker/employer/main_dashboard.dart';
import 'package:student_worker/employer/review_and_post_job.dart';
import 'package:student_worker/global/studentbaseWidget.dart';
import 'package:student_worker/jobs/jobConfirm.dart';
import 'package:student_worker/jobs/jobDescriptionMain.dart';
import 'package:student_worker/onboarding/onboarding_page.dart';
import 'package:student_worker/resume/resume_page1.dart';
import 'package:student_worker/splash/splash_screen.dart';

import '../auth/identity_page.dart';
import '../resume/resume_page2.dart';
import '../resume/resume_page3.dart';

// the global navigator key
final navigatorKey = GlobalKey<NavigatorState>();
final navigator = navigatorKey.currentState;

// a list of all the pages in the app
final loading = '/';
final studentBaseWidget = 'baseWidget';
final jobDescription = 'jobDescription';
final appliedJobDescription = 'appliedJobDescription';
final jobConfirm = 'jobConfirm';
final onBoarding = 'onBoarding';
final identifyUser = 'identity';
final resumePage1 = 'resumePage1';
final resumePage2 = 'resumePage2';
final resumePage3 = 'resumePage3';
final signup = 'signup';
final login = 'login';
final dashboard = 'employer_dashboard';
final createEmployerAcct1 = 'createEmployerAcct1';
final createEmployerAcct2 = 'createEmployerAcct2';
final employerBaseWidget = 'employerBaseWidget';
final reviewAndPostAJob = 'reviewAndPostAJob';

// a map of all the pages in the app
final Map? pages = <String, Widget Function(BuildContext)?>{
  loading: (_) => SplashScreen(),
  onBoarding: (_) => OnBoardingScreen(),
  identifyUser: (_) => IdentifyUser(),
  resumePage1: (_) => ResumePage1(),
  resumePage2: (_) => ResumePage2(),
  resumePage3: (_) => ResumePage3(),
  studentBaseWidget: (_) => StudentBaseWidget(),
  jobDescription: (_) => JobDescriptionMain(),
  appliedJobDescription: (_) => AppliedJobDescription(),
  jobConfirm: (_) => JobConfirm(),
  signup: (_) => SignupScreen(),
  login: (_) => LoginScreen(),
  dashboard: (_) => DashBoard(),
  employerBaseWidget: (_) => EmployerBaseWidget(),
  createEmployerAcct1: (_) => CreateEmployerAcct1(),
  createEmployerAcct2: (_) => CreateEmployerAcct2(),
  reviewAndPostAJob: (_) => ReviewAndPostJob()
};
