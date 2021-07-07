import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_worker/splash/splash_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read(splashProvider).doBackgroundTask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: Center(
        child: Text(
          "StudentWorker",
          style: GoogleFonts.roboto(
              textStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 25,
            letterSpacing: 2,
            color: Colors.purple[900],
          )),
        ),
      ),
    );
  }
}
