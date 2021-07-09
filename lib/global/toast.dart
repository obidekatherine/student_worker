import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';

class Toast {
  static void showText(String text, [int durationInSeconds = 5]) {
    BotToast.showText(
        text: text, duration: Duration(seconds: durationInSeconds));
  }

  static void showLoading() {
    BotToast.showCustomLoading(
      toastBuilder: (void Function() cancelFunc) {
        return Card(
          color: Colors.black.withOpacity(.3),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green.shade900),
            ),
          ),
        );
      },
      backgroundColor: Colors.black.withOpacity(.4),
    );
  }

  static void stopLoading() {
    BotToast.closeAllLoading();
  }

  static Future<void> fakeLoading(String text) async {
    showLoading();
    await Future.delayed(Duration(milliseconds: 1500), Toast.stopLoading);
    showText(text);
  }
}
