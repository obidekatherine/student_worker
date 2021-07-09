import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import 'package:student_worker/global/pages.dart';
import 'package:student_worker/global/sp.dart';
import 'package:student_worker/global/toast.dart';

final authProvider = ChangeNotifierProvider((ref) => AuthProvider());

class AuthProvider extends ChangeNotifier {
  StudentWorker selected = StudentWorker.none;

  Duration opacityDuration = Duration(milliseconds: 500);
  double opacity = 0;
  String url = 'https://student-worker2.herokuapp.com';

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  bool passwordIsHidden = true;
  bool readOnly = false;

  String signupAppBarTitle() => selected == StudentWorker.student
      ? 'Student Sign Up'
      : 'Employer Sign Up';

  String loginAppBarTitle() =>
      selected == StudentWorker.student ? 'Student Login' : 'Emplyer Login';

  void initController() => emailController.text = SP.getString(emailKey) ?? '';

  void onStudentChanged(StudentWorker? value) async {
    selected = value!;
    notifyListeners();
    await Future.delayed(Duration(milliseconds: 400));
    opacity = 1;
    notifyListeners();
    SP.setBool(userIsStudentKey, true);
  }

  void onEmployerChanged(StudentWorker? value) async {
    selected = value!;
    notifyListeners();
    await Future.delayed(Duration(milliseconds: 400));
    opacity = 1;
    notifyListeners();
    SP.setBool(userIsStudentKey, false);
  }

  void onContinueClicked() {
    navigator!.pushNamed(signup);
  }

  void onTextChanged(key, value) {
    print('$key, $value');
    SP.setString(key, value);
  }

  void togglePasswordView() {
    passwordIsHidden = !passwordIsHidden;
    notifyListeners();
  }

  void goToLogin() => navigator!.pushNamed(login);

  void backToSignup() => navigator!.pop();

  // ignore: missing_return
  String? Function(String?)? emailValidator = (String? data) {
    if ((data?.length ?? 0) >= 1) {
      if (!(data?.contains('@') ?? false)) {
        return '@ is missing';
      } else {
        if (!(data?.contains('.') ?? false)) {
          return '. is missing';
        } else {
          if (((data?.length ?? 0) < 6)) {
            return 'it\'s too short';
          }
        }
      }
    }
  };

  /// Simply checks the length of [data] if it results in error
  /// strengthen the data type like the one for email validator
  // ignore: missing_return
  String? passwordValidator(data) {
    if (data.length >= 1) {
      if (data.length < 6) {
        return 'it should be at least 6 characters long';
      }
    }
  }

  bool validateEmail() {
    bool containsAt = emailController.text.contains('@');
    bool containsPeriod = emailController.text.contains('.');
    bool isLengthy = emailController.text.length > 5;
    return containsAt && containsPeriod && isLengthy;
  }

  bool formIsEmpty() =>
      emailController.text.isEmpty || emailController.text.isEmpty;

  void onAuthPressed(AuthAction action) {
    if (formIsEmpty()) return Toast.showText('all fields are required');
    if (!validateEmail())
      return Toast.showText('please fill your email properly');
    if (passwordController.text.length < 6)
      return Toast.showText('your password is too weak');
    if (action == AuthAction.signup)
      performAuthAction(action);
    else
      performAuthAction(action);
  }

  String getEndpoint(AuthAction action) {
    bool isSignup = action == AuthAction.signup;
    bool isStudent = selected == StudentWorker.student;
    if (isSignup && isStudent) return 'signupStudent';
    if (isSignup && !isStudent) return 'signupEmployer';
    if (!isSignup && isStudent) return 'loginStudent';
    return 'loginEmployer';
  }

  // either signup or login the student or employer
  void performAuthAction(AuthAction action) async {
    Toast.showLoading();
    http.Response? res;
    bool isSignup = action == AuthAction.signup;

    try {
      res = await http.post(
        Uri.parse('$url/${getEndpoint(action)}'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          emailKey: emailController.text.trim(),
          passwordKey: passwordController.text.trim(),
        }),
      );
      Toast.stopLoading();
      var data = json.decode(res.body);
      if (res.statusCode != 200) {
        print(data['error']);
        return Toast.showText(data['error']);
      }
      Toast.showText(isSignup
          ? "you have successfuly signed up"
          : "you have successfully logged in");
      print(data[tokenKey]);
      SP.setString(tokenKey, data[tokenKey]);
      moveToNextPage(action);
    } catch (e) {
      Toast.stopLoading();
      Toast.showText('The signup failed: \n$e');
      print(e);
      print(res?.body);
    }
  }

  void moveToNextPage(AuthAction action) {
    if (action == AuthAction.signup) {
      SP.setBool(loggedInTag, true);
      bool isStudent = selected == StudentWorker.student;
      navigator!.pushNamedAndRemoveUntil(
          isStudent ? resumePage1 : createEmployerAcct1, (route) => false);
      return;
    }
    SP.setBool(loggedInTag, true);
    bool hasCompletedProfile = SP.getBool(hasCompletedResumeKey) ?? false;
    bool employerHasCreatedAcct =
        SP.getBool(employerHasCreatedAcctKey) ?? false;
    bool isStudent = selected == StudentWorker.student;
    if (hasCompletedProfile || employerHasCreatedAcct) {
      navigator!.pushNamedAndRemoveUntil(
          isStudent ? studentBaseWidget : employerBaseWidget, (route) => false);
    }
    navigator!.pushNamedAndRemoveUntil(
        isStudent ? resumePage1 : createEmployerAcct1, (route) => false);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

enum StudentWorker { student, employer, none }
enum AuthAction { signup, login }
