import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unitrack/UI/Theme/themeModeNotifier.dart';

class AddExamBt extends ConsumerWidget {
  const AddExamBt({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeMode currentThemeMode = ref.watch(themeModeProvider);
    
    return Center(
      child: ElevatedButton.icon(
      onPressed: () {
        
      },
      icon: Icon(
        CupertinoIcons.plus,
      ),
      label: const Text('Aggiungi Esame'),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 45), 
        minimumSize: const Size(200, 50), 
        backgroundColor: currentThemeMode == ThemeMode.dark ? const Color.fromARGB(255, 255, 0, 0) : const Color.fromARGB(255, 255, 162, 0)
      ),
      ),
    );
    
  }
}