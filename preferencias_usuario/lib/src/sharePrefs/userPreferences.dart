import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instance = new UserPreferences._internal();

  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._internal();

  late SharedPreferences _pref;

  initPreferences() async {
    _pref = await SharedPreferences.getInstance();
  }

  int get genero {
    return _pref.getInt('gender') ?? 1;
  }

  set genero(int gender) {
    _pref.setInt('gender', gender);
  }

  bool get secondaryColor {
    return _pref.getBool('secondaryColor') ?? false;
  }

  set secondaryColor(bool secondaryColor) {
    _pref.setBool('secondaryColor', secondaryColor);
  }

  String get name {
    return _pref.getString('name') ?? '';
  }

  set name(String name) {
    _pref.setString('name', name);
  }

  String get lastPage {
    return _pref.getString('lastPage') ?? 'home';
  }

  set lastPage(String lastPage) {
    _pref.setString('lastPage', lastPage);
  }
}
