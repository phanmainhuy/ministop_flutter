import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  late SharedPreferences _prefs;

  Future<void> setup() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String? get passwordSaved {
    return _prefs.getString('password_saved');
  }

  set passwordSaved(String? value) {
    _prefs.setString('password_saved', value ?? '');
  }

  String? get emailSaved {
    return _prefs.getString('email_saved');
  }

  set emailSaved(String? value) {
    _prefs.setString('email_saved', value ?? '');
  }

  void removeSaved() {
    _prefs.remove('password_saved');
    _prefs.remove('email_saved');
  }
}
