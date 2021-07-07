import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:student_worker/jobs/jobProvider.dart';

class ApplicationSuccess extends StatelessWidget {
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
                'Your application has been submitted!',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    // side: BorderSide(width: 1),
                    ),
                onPressed: context.read(jobProvider).onFindMoreJobsTap,
                child: Text('Find more jobs'),
              ),
              SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
