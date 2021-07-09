import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_worker/global/pages.dart';

final onBoardingProvider =
    ChangeNotifierProvider.autoDispose((ref) => OnBoardingProvider());

class OnBoardingProvider extends ChangeNotifier {
  final controller = PageController();
  int currentPage = 0;

  final List<Map<String, String>> splashData = [
    {
      "title": "StudentWorker",
      "image": "assets/vector.png",
      "subtitle": "Find part-time jobs and earn while you school",
    },
    {
      "title": "StudentWorker",
      "image": "assets/vector1.png",
      "subtitle": "Hire students on part-time and save capital",
    },
  ];

  void getStartedPressed() {
    if (currentPage == 0) {
      controller.nextPage(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );
      currentPage = 1;
      notifyListeners();
    } else
      navigator!.pushReplacementNamed(identifyUser);
  }
}
