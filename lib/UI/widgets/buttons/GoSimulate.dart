import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unitrack/model/managers/shared_preferences/themeModeNotifier.dart';
import 'package:unitrack/model/Model.dart';

class GoSimulate extends ConsumerWidget {
  const GoSimulate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentThemeMode = ref.watch(themeModeProvider);
    final isSession = ref.watch(modelProvider).isSession;
    
    final baseColor = currentThemeMode == ThemeMode.dark 
        ? const Color(0xFFD500F9) 
        : const Color(0xFF651FFF);

    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: isSession 
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
          icon: const Icon(CupertinoIcons.wand_stars),
          label: const Text('Simula'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 45), 
            minimumSize: const Size(200, 50), 
            backgroundColor: isSession ? baseColor : baseColor.withValues(alpha: 0.4),
            elevation: 0,
          ),
        ),
      ),
    );
  }
}