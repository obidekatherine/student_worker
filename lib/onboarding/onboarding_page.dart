import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'onboarding_provider.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  AnimatedContainer _buildDots({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        color: const Color(0xFF293241),
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: context.read(onBoardingProvider).currentPage == index ? 20 : 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: context.read(onBoardingProvider).controller,
                itemCount: context.read(onBoardingProvider).splashData.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      Spacer(flex: 2),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Text(
                          context
                              .read(onBoardingProvider)
                              .splashData[index]['title']!
                              .toUpperCase(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: const Color(0xff1F135B),
                          )),
                        ),
                      ),
                      Spacer(
                        flex: 2,
                      ),
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.asset(
                          context.read(onBoardingProvider).splashData[index]
                              ['image']!,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Text(
                        context.read(onBoardingProvider).splashData[index]
                            ['subtitle']!,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: const Color(0xff000000),
                        )),
                      ),
                    ],
                  );
                },
                onPageChanged: (value) => setState(
                    () => context.read(onBoardingProvider).currentPage = value),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        context.read(onBoardingProvider).splashData.length,
                        (int index) => _buildDots(index: index),
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: SizedBox(
                      height: 45,
                      width: MediaQuery.of(context).size.width,
                      // ignore: deprecated_member_use
                      child: FlatButton(
                        onPressed:
                            context.read(onBoardingProvider).getStartedPressed,
                        child: Consumer(
                          builder: (_, watch, __) {
                            var op = watch(onBoardingProvider);
                            return Text(
                              op.currentPage == 0 ? 'Next' : 'Get Started',
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xffFFFFFF),
                              )),
                            );
                          },
                        ),
                        color: const Color(0xFF0A674F),
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
