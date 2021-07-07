import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_worker/jobs/jobProvider.dart';

class BaseWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, watch, __) {
        var jp = watch(jobProvider);
        return Scaffold(
          body: jp.selectScreen(),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: jp.onNavItemTap,
            currentIndex: jp.currentNavIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.work_outline), label: 'Jobs'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outlined), label: 'Applications'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.file_copy_outlined), label: 'Resume'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_pin), label: 'Profile'),
            ],
          ),
        );
      },
    );
  }
}
