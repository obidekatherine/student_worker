import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_worker/employer/review_and_post_job.dart';
import 'package:student_worker/general/global.dart';
import 'package:student_worker/general/sp.dart';

final splashProvider = Provider((ref) => SplashProvider());

class SplashProvider {
  void doBackgroundTask() async {
    await SP.init();
    await Future.delayed(Duration(seconds: 3));
    bool isFirstTime = SP.getBool(firstTimeUserKey) ?? true;
    bool isLoggedIn = SP.getBool(loggedInTag) ?? false;
    goToNextPage(isFirstTime, isLoggedIn);
  }

  void goToNextPage(bool isFirstTime, bool isLoggedIn) {
    if (isFirstTime) {
      navigator!.pushReplacementNamed(onBoarding);
      SP.setBool(firstTimeUserKey, false);
      return;
    }
    if (isLoggedIn) {
      bool hasCompletedProfile = SP.getBool(hasCompletedResumeKey) ?? false;
      bool employerHasCreatedAcct =
          SP.getBool(employerHasCreatedAcctKey) ?? false;
      bool isStudent = SP.getBool(userIsStudentKey) ?? false;
      if (hasCompletedProfile || employerHasCreatedAcct)
        navigator!.pushReplacementNamed(
            isStudent ? studentBaseWidget : employerBaseWidget);
      else
        navigator!.pushReplacementNamed(identifyUser);
      return;
    }
    navigator!.pushReplacementNamed(identifyUser); //resumePage1
  }
}
