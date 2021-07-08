import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_worker/general/global.dart';
import 'package:student_worker/general/sp.dart';

final resumeProvider = ChangeNotifierProvider((ref) => ResumeProvider());

class ResumeProvider extends ChangeNotifier {
  // resume page 1 controllers
  var firstnameController = TextEditingController();
  var lastnameController = TextEditingController();
  var countryCodeController = TextEditingController();
  var mobileNumberController = TextEditingController();
  var currentStateController = TextEditingController();
  var cityController = TextEditingController();

  // resume page 2
  var schoolController = TextEditingController();
  var courseController = TextEditingController();
  var startYearController = TextEditingController();
  var endYearController = TextEditingController();

  // resume page 3
  var skill1Controller = TextEditingController();
  var skill2Controller = TextEditingController();
  var skill3Controller = TextEditingController();

  void initPage1Controllers() {
    firstnameController.text = SP.getString(studentFirstnameKey) ?? '';
    lastnameController.text = SP.getString(studentLastnameKey) ?? '';
    countryCodeController.text = SP.getString(studentCountryCodeKey) ?? '';
    mobileNumberController.text = SP.getString(studentMobileNumberKey) ?? '';
    currentStateController.text = SP.getString(studentCurrentStateKey) ?? '';
    cityController.text = SP.getString(studentCityKey) ?? '';
  }

  void initPage2Controllers() {
    schoolController.text = SP.getString(studentSchoolKey) ?? '';
    courseController.text = SP.getString(studentCourseKey) ?? '';
    startYearController.text = SP.getString(studentStartYearKey) ?? '';
    endYearController.text = SP.getString(studentEndYearKey) ?? '';
  }

  void initPage3Controllers() {
    skill1Controller.text = SP.getString(studentSkill1Key) ?? '';
    skill2Controller.text = SP.getString(studentSkill2Key) ?? '';
    skill3Controller.text = SP.getString(studentkill3Key) ?? '';
  }

  void onChanged(key, value) {
    print('$key, $value');
    SP.setString(key, value);
  }

  void previousPage() => navigator!.pop();

  void moveToBaseWidget() {
    SP.setBool(hasCompletedResumeKey, true);
    SP.setBool(loggedInTag,
        true); // TODO: remove this line and put it in the login logic
    navigator!.pushNamedAndRemoveUntil(studentBaseWidget, (route) => false);
  }

  void movetToPage2() => navigator!.pushNamed(resumePage2);

  void moveToPage3() => navigator!.pushNamed(resumePage3);

  @override
  void dispose() {
    super.dispose();
    firstnameController.dispose();
    lastnameController.dispose();
    countryCodeController.dispose();
    mobileNumberController.dispose();
    currentStateController.dispose();
    cityController.dispose();
    //
    schoolController.dispose();
    courseController.dispose();
    startYearController.dispose();
    endYearController.dispose();
    //
    skill1Controller.dispose();
    skill2Controller.dispose();
    skill3Controller.dispose();
  }
}
