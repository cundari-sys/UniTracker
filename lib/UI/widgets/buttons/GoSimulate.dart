import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unitrack/UI/Theme/themeModeNotifier.dart';

class GoSimulate extends ConsumerWidget {
  const GoSimulate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeMode currentThemeMode = ref.watch(themeModeProvider);
    
    return Center(
      child: ElevatedButton.icon(
      onPressed: () {
        
      },
      icon: Icon(
        CupertinoIcons.wand_stars,
      ),
      label: const Text('Simula'),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 45), 
        minimumSize: const Size(200, 50), 
        backgroundColor: currentThemeMode == ThemeMode.dark ? Color(0xFFD500F9) : Color(0xFF651FFF)
      ),
      ),
    );
    
  }
}