import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unitrack/UI/Theme/dark_theme.dart';
import 'package:unitrack/UI/Theme/light_theme.dart';
import 'package:unitrack/model/utility/Constants.dart';
import 'pages/layout.dart';
import 'package:unitrack/model/managers/shared_preferences/themeModeNotifier.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeMode currentThemeMode = ref.watch(themeModeProvider);
    return MaterialApp(
      title: Constants.appName,
      debugShowCheckedModeBanner: false,
      themeMode: currentThemeMode,
      theme: LightTheme.theme,
      darkTheme: DarkTheme.theme,
      home: const Layout(),
    );
  }
}