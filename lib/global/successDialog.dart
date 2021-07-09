import 'package:flutter/material.dart';

class ApplicationSuccess extends StatelessWidget {
  final String message, actionTitle;
  final void Function() action;

  ApplicationSuccess({
    required this.message,
    required this.actionTitle,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      title: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: CircleAvatar(
                radius: 23,
                backgroundColor: Colors.grey,
                child: Icon(Icons.check, color: Colors.white),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(height: 40, color: Colors.grey.withOpacity(.3)),
              SizedBox(height: 30),
              Text(
                message,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    // side: BorderSide(width: 1),
                    ),
                onPressed: action,
                child: Text(actionTitle),
              ),
              SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
