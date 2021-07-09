import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_worker/employer/create_job_to_post.dart';
import 'package:student_worker/employer/main_dashboard.dart';
import 'package:student_worker/global/pages.dart';
import 'package:student_worker/global/sp.dart';
import 'package:student_worker/global/successDialog.dart';

final employerProvider = ChangeNotifierProvider((ref) => EmployerProvider());

class EmployerProvider extends ChangeNotifier {
  // 1
  var firstnameController = TextEditingController();
  var lastnameController = TextEditingController();
  var countryCodeController = TextEditingController();
  var mobileNumberController = TextEditingController();
  var currentStateController = TextEditingController();
  var cityController = TextEditingController();
  // 2
  var companyNameController = TextEditingController();
  var descriptionController = TextEditingController();
  var addressController = TextEditingController();
  var stateController = TextEditingController();

  static const int postJobs = 0;
  static const int dashboard = 1;
  static const int profile = 2;
  int currentNavIndex = 0;

  void onNavItemTap(int i) {
    currentNavIndex = i;
    notifyListeners();
  }

  Widget selectScreen() {
    switch (currentNavIndex) {
      case postJobs:
        return CreateJobToPost();
      case dashboard:
        return DashBoard();
      case profile:
        return Center(child: Text('Profile'));
      default:
        return Center(child: Text('Unknwon'));
    }
  }

  void initPage1Controllers() {
    firstnameController.text = SP.getString(employerFirstnameKey) ?? '';
    lastnameController.text = SP.getString(employerLastnameKey) ?? '';
    countryCodeController.text = SP.getString(employerCountryCodeKey) ?? '';
    mobileNumberController.text = SP.getString(employerMobileNumberKey) ?? '';
    currentStateController.text = SP.getString(employerCurrentStateKey) ?? '';
    cityController.text = SP.getString(employerCityKey) ?? '';
  }

  void initPage2Controllers() {
    companyNameController.text = SP.getString(employerCompanyNameKey) ?? '';
    descriptionController.text = SP.getString(employerDescriptionKey) ?? '';
    addressController.text = SP.getString(employerAddressKey) ?? '';
    stateController.text = SP.getString(employerCurrentStateKey) ?? '';
  }

  void onChanged(String key, String value) => SP.setString(key, value);

  void movetToPage2() => navigator!.pushNamed(createEmployerAcct2);
  void previousPage() => navigator!.pop();

  void goToReviewJob() => navigator!.pushNamed(reviewAndPostAJob);

  void moveToPostJob() {
    SP.setBool(employerHasCreatedAcctKey, true);
    SP.setBool(hasCompletedResumeKey, true);
    SP.setBool(loggedInTag, true);
    // TODO: remove the above line and put it in the login logic
    navigator!.pushNamedAndRemoveUntil(employerBaseWidget, (route) => false);
  }

  void onCreateNewJobTapped() =>
      navigator!.pushNamedAndRemoveUntil(employerBaseWidget, (route) => false);

  void onConfirmJobToPost() {
    showDialog(
        context: navigator!.context,
        builder: (_) => ApplicationSuccess(
            message: 'Your job has been posted',
            actionTitle: 'Create a new job',
            action: onCreateNewJobTapped));
  }
}
