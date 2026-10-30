class Light {
  static final Light _instance = Light._internal();
  factory Light() => _instance;
  Light._internal();
  static Light get instance => _instance;
  
  bool get isSession {
    return [1, 2, 6, 7].contains(DateTime.now().month);
  }
}