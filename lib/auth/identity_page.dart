import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_provider.dart';

class IdentifyUser extends StatefulWidget {
  @override
  _IdentifyUserState createState() => _IdentifyUserState();
}

class _IdentifyUserState extends State<IdentifyUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 150, right: 0, left: 0, bottom: 0),
                child: Text(
                  'StudentWorker',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    letterSpacing: 2,
                    color: Color(0xff1F135B),
                  )),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Who are you?',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                letterSpacing: 2,
                color: Color(0xff000000),
              )),
            ),
            Consumer(
              builder: (_, watch, __) {
                var ap = watch(authProvider);
                return RadioListTile<StudentWorker>(
                  activeColor: Colors.green[900],
                  title: const Text('Student seeking part-time job'),
                  value: StudentWorker.student,
                  groupValue: ap.selected,
                  onChanged: ap.onStudentChanged,
                );
              },
            ),
            Consumer(
              builder: (_, watch, __) {
                var ap = watch(authProvider);
                return RadioListTile<StudentWorker>(
                  activeColor: Colors.green[900],
                  selectedTileColor: Colors.green[900],
                  title: const Text('Employer'),
                  value: StudentWorker.employer,
                  groupValue: ap.selected,
                  onChanged: ap.onEmployerChanged,
                );
              },
            ),
            SizedBox(height: 16),
            Consumer(
              builder: (_, watch, __) {
                var ap = watch(authProvider);
                return AnimatedOpacity(
                  duration: ap.opacityDuration,
                  opacity: ap.opacity,
                  child: ElevatedButton(
                    onPressed: ap.onContinueClicked,
                    style: ElevatedButton.styleFrom(primary: Colors.green[900]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('Continue'),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
