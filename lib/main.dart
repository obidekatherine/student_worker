import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'general/global.dart';

void main() {
  runApp(ProviderScope(child: StudentWorker()));
}

class StudentWorker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Student Worker',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) =>
          CupertinoPageRoute(builder: pages?[settings.name]),
    );
  }

  
}
