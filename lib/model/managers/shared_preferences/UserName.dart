import 'package:shared_preferences/shared_preferences.dart';

class Username {
  static final Username _instance = Username._internal();
  factory Username() => _instance;
  Username._internal();
  static Username get instance => _instance;
  static const String _userKey = 'user_name';

  Future<String?> getNome() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(_userKey);
  }

  Future<void> setNome(String value) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(_userKey, value);
  }

}