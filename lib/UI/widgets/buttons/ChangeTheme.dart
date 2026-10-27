import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unitrack/model/managers/shared_preferences/themeModeNotifier.dart';

class Changetheme extends ConsumerWidget {
  const Changetheme({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeMode currentThemeMode = ref.watch(themeModeProvider);
    
    return Center(
      child: ElevatedButton.icon(
      onPressed: () {
        ref.read(themeModeProvider.notifier).toggleTheme();
      },
      icon: Icon(
        currentThemeMode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode,
      ),
      label: Text(
        currentThemeMode == ThemeMode.dark ? 'Modalità Chiara' : 'Modalità Scura',
      ),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 45), 
        minimumSize: const Size(200, 50), 
      ),
      ),
    );
    
  }
}