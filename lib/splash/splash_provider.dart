import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_worker/global.dart';
import 'package:student_worker/sp.dart';

final splashProvider = Provider((ref) => SplashProvider());

class SplashProvider {
  void doBackgroundTask() async {
    await SP.init();
    await Future.delayed(Duration(seconds: 3));
    bool isFirstTime = SP.getBool(firstTimeTag) ?? true;
    bool isLoggedIn = SP.getBool(loggedInTag) ?? false;
    goToNextPage(isFirstTime, isLoggedIn);
  }

  void goToNextPage(bool isFirstTime, bool isLoggedIn) {
    if (isFirstTime) {
      navigator!.pushReplacementNamed(onBoarding);
      SP.setBool(firstTimeTag, false);
      return;
    }
    if (isLoggedIn) {
      bool hasCompletedProfile = SP.getBool(hasCompletedProfileTag) ?? false;
      if (hasCompletedProfile)
        navigator!.pushReplacementNamed(baseWidget);
      else
        navigator!.pushReplacementNamed(resumePage1);
      // TODO: change the above code to go to the page where they'll select if they're a student or employer so that they can complete their profile
      return;
    }
    navigator!.pushReplacementNamed(resumePage1);
    // TODO: change the above code to go to the page where they'll select if they're a student or employer so that they can login
  }
}
