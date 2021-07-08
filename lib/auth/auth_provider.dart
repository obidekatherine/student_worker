import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_worker/general/global.dart';
import 'package:student_worker/general/sp.dart';

final authProvider = ChangeNotifierProvider((ref) => AuthProvider());

class AuthProvider extends ChangeNotifier {
  StudentWorker selected = StudentWorker.none;

  Duration opacityDuration = Duration(milliseconds: 500);
  double opacity = 0;

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

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void goToLogin() => navigator!.pushNamed(login);

  void backToSignup() => navigator!.pop();

  void signupUser() {
    SP.setBool(loggedInTag, true);
    bool isStudent = selected == StudentWorker.student;
    navigator!.pushNamedAndRemoveUntil(
        isStudent ? resumePage1 : createEmployerAcct1, (route) => false);
  }

  void loginUser() {
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
}

enum StudentWorker { student, employer, none }
