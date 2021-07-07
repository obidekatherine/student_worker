import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_worker/global.dart';
import 'package:student_worker/sp.dart';

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
    firstnameController.text = SP.getString(firstnameTag) ?? '';
    lastnameController.text = SP.getString(lastnameTag) ?? '';
    countryCodeController.text = SP.getString(countryCodeTag) ?? '';
    mobileNumberController.text = SP.getString(mobileNumberTag) ?? '';
    currentStateController.text = SP.getString(currentStateTag) ?? '';
    cityController.text = SP.getString(cityTag) ?? '';
  }

  void initPage2Controllers() {
    schoolController.text = SP.getString(schoolTag) ?? '';
    courseController.text = SP.getString(courseTag) ?? '';
    startYearController.text = SP.getString(startYearTag) ?? '';
    endYearController.text = SP.getString(endYearTag) ?? '';
  }

  void initPage3Controllers() {
    skill1Controller.text = SP.getString(skill1Tag) ?? '';
    skill2Controller.text = SP.getString(skill2Tag) ?? '';
    skill3Controller.text = SP.getString(skill3Tag) ?? '';
  }

  void onChanged(key, value) => SP.setString(key, value);

  void previousPage() => navigator!.pop();

  void moveToBaseWidget() {
    SP.setBool(hasCompletedProfileTag, true);
    SP.setBool(loggedInTag, true); // TODO: remove this line and put it in the login logic
    navigator!.pushNamedAndRemoveUntil(baseWidget, (route) => false);
  }

  void movetToPage2() => navigator!.pushNamed(resumePage2);

  void moveToPage3() => navigator!.pushNamed(resumePage3);

  @override
  void dispose() {
    super.dispose();
    // TODO: Dispose all the text editing controllers
  }
}
