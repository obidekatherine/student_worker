import 'package:shared_preferences/shared_preferences.dart';

// global tags to be used with shared preferences

final String firstTimeTag = 'firstTime';
final String loggedInTag = 'loggedIn';
final String hasCompletedProfileTag = 'hasCompletedResume';
final String firstnameTag = 'firstname';
final String lastnameTag = 'lastname';
final String countryCodeTag = 'countryCode';
final String mobileNumberTag = 'mobileNumber';
final String currentStateTag = 'currentState';
final String cityTag = 'city';
final String schoolTag = 'schoolTag';
final String courseTag = 'courseTag';
final String startYearTag = 'startYearTag';
final String endYearTag = 'endYearTag';
final String skill1Tag = 'skill1Tag';
final String skill2Tag = 'skill2Tag';
final String skill3Tag = 'skill3Tag';

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
}
