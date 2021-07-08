import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'employer_provider.dart';


class EmployerBaseWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, watch, __) {
        var ap = watch(employerProvider);
        return Scaffold(
          body: ap.selectScreen(),
          bottomNavigationBar: BottomNavigationBar(
            onTap: ap.onNavItemTap,
            currentIndex: ap.currentNavIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.work_outline), label: 'Jobs'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outlined), label: 'Dashboard'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_pin), label: 'Profile'),
            ],
          ),
        );
      },
    );
  }
}
