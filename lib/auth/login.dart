import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:student_worker/auth/auth_provider.dart';
import 'package:student_worker/general/my_text_field.dart';
import 'package:student_worker/general/sp.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenstate createState() {
    return _LoginScreenstate();
  }
}

class _LoginScreenstate extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    context.read(authProvider).initController();
  }

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              color: Color(0xff000000),
            ),
          ),
        ),
        SizedBox(height: 3),
        MyTextField(
          hintText: 'danielsilver12@gmail.com',
          keyboardType: TextInputType.emailAddress,
          controller: context.read(authProvider).emailController,
          onChanged: (value) =>
              context.read(authProvider).onTextChanged(emailKey, value),
        ),
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              color: Color(0xff000000),
            ),
          ),
        ),
        SizedBox(height: 3),
        Consumer(
          builder: (_, watch, __) {
            var ap = watch(authProvider);
            return MyTextField(
              maxLines: 1,
              hintText: 'Machine',
              obscureText: ap.passwordIsHidden,
              suffixIcon: IconButton(
                  icon: Icon(Icons.remove_red_eye_outlined),
                  onPressed: ap.togglePasswordView),
              keyboardType: TextInputType.visiblePassword,
              controller: ap.passwordController,
              onChanged: (value) =>
                  context.read(authProvider).onTextChanged(passwordKey, value),
            );
          },
        ),
      ],
    );
  }

  Widget buildPasswordMin() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(8.00),
      child: Text(
        'Minimum of 6 characters',
        style: TextStyle(
          color: Colors.black38,
        ),
      ),
    );
  }

  Widget buildTermsAndCondition() {
    return InkWell(
      onTap: () {},
      child: RichText(
        text: TextSpan(
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color(0xff000000),
            ),
          ),
          text: 'By Signing Up You Agree To Our ',
          children: [
            TextSpan(
              text: 'Terms and Conditions',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget buildLoginButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF0A674F)),
        ),
        onPressed: context.read(authProvider).loginUser,
        child: Text(
          'Login',
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              color: Color(0xffF8F8F8),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSignupBtn() {
    return InkWell(
      onTap: context.read(authProvider).backToSignup,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
                text: 'Already Have An Account? ',
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xff000000),
                ))),
            TextSpan(
                text: 'Sign Up',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Color(0xffE5E5E5),
        centerTitle: true,
        title: Text(
          context.read(authProvider).loginAppBarTitle(),
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              fontWeight: FontWeight.w400,
              // fontSize: 20,
              color: Color(0xff1F135B),
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xffE5E5E5),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 20),
            buildEmail(),
            SizedBox(height: 20),
            buildPassword(),
            buildPasswordMin(),
            SizedBox(height: 40),
            buildTermsAndCondition(),
            buildLoginButton(),
            buildSignupBtn(),
          ],
        ),
      ),
    );
  }
}
