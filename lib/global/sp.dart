import 'package:shared_preferences/shared_preferences.dart';

// global tags to be used with shared preferences
// general
final emailKey = 'email';
final passwordKey = 'password';
final userIsStudentKey = 'userIsStudent';
final tokenKey = 'token';

// student
final firstTimeUserKey = 'firstTimeUser';
final loggedInTag = 'loggedIn';
final hasCompletedResumeKey = 'hasCompletedResume';
final studentFirstnameKey = 'firstname';
final studentLastnameKey = 'lastname';
final studentCountryCodeKey = 'countryCode';
final studentMobileNumberKey = 'mobileNumber';
final studentCurrentStateKey = 'currentState';
final studentCityKey = 'city';
final studentSchoolKey = 'school';
final studentCourseKey = 'course';
final studentStartYearKey = 'startYear';
final studentEndYearKey = 'endYear';
final studentSkill1Key = 'skill1';
final studentSkill2Key = 'skill2';
final studentSkill3Key = 'skill3';

// employer
final employerHasCreatedAcctKey = 'employerHasCreatedAcct';
final employerFirstnameKey = 'employerFirstname';
final employerLastnameKey = 'employerLastname';
final employerCountryCodeKey = 'employerCountryCode';
final employerMobileNumberKey = 'employerMobileNumber';
final employerCurrentStateKey = 'employerCurrentState';
final employerCityKey = 'employerCity';
final employerCompanyNameKey = 'employerCompanyName';
final employerDescriptionKey = 'employerDescription';
final employerAddressKey = 'employerAddress';

class SP {
  static SharedPreferences? _sp;

  static Future<void> init() async {
    _sp = await SharedPreferences.getInstance();
  }

  static void setInt(String key, int value) => _sp!.setInt(key, value);
  static void setBool(String key, bool value) => _sp!.setBool(key, value);
  static void setString(String key, String value) => _sp!.setString(key, value);
  static void setDouble(String key, double value) => _sp!.setDouble(key, value);
  static void setStringList(String key, List<String> value) =>
      _sp!.setStringList(key, value);

  static int? getInt(key) => _sp!.getInt(key);
  static bool? getBool(key) => _sp!.getBool(key);
  static String? getString(key) => _sp!.getString(key);
  static double? getDouble(key) => _sp!.getDouble(key);
  static List<String>? getStringList(key) => _sp!.getStringList(key);

  static void clear() => _sp!.clear();
}
