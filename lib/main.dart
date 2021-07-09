import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'global/pages.dart';

void main() {
  runApp(ProviderScope(child: StudentWorker()));
}

class StudentWorker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      title: 'Student Worker',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) =>
          CupertinoPageRoute(builder: pages?[settings.name]),
    );
  }

  
}
