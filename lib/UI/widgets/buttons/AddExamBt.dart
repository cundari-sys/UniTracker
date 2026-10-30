import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unitrack/model/managers/shared_preferences/themeModeNotifier.dart';
import 'package:unitrack/model/Model.dart';

class AddExamBt extends ConsumerWidget {
  const AddExamBt({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentThemeMode = ref.watch(themeModeProvider);
    final isSession = ref.watch(modelProvider).isSession;
    
    final baseColor = currentThemeMode == ThemeMode.dark 
        ? const Color.fromARGB(255, 255, 0, 0) 
        : const Color.fromARGB(255, 255, 162, 0);

    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: !isSession 
              ? [
                  BoxShadow(
                    color: baseColor.withValues(alpha: 0.9), 
                    blurRadius: 35, 
                    spreadRadius: 6, 
                    offset: const Offset(0, 0), 
                  )
                ] 
              : [],
        ),
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.plus),
          label: const Text('Aggiungi Esame'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 45), 
            minimumSize: const Size(200, 50), 
            backgroundColor: !isSession ? baseColor : baseColor.withValues(alpha: 0.4), 
            elevation: 0, 
          ),
        ),
      ),
    );
  }
}