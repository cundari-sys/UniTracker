import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unitrack/UI/Theme/TextField/TexFieldStyle.dart';
import 'package:unitrack/model/Model.dart';

class Namebox extends ConsumerStatefulWidget {
  const Namebox({super.key});

  @override
  ConsumerState<Namebox> createState() => _NameState();
}

class _NameState extends ConsumerState<Namebox> {
  final TextEditingController _name = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Positioned.fill(
      child: Material(
        color: Colors.black.withValues(alpha: 0.3), 
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Center( 
            child: SingleChildScrollView( 
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                  decoration: BoxDecoration(
                    color: isDarkMode ? const Color(0xE61C1C1E) : const Color(0xE6FFFFFF),
                    borderRadius: BorderRadius.circular(32),
                    border: Border.all(
                      color: isDarkMode ? Colors.white.withValues(alpha: 0.1) : Colors.black.withValues(alpha: 0.05),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: isDarkMode ? 0.4 : 0.15),
                        blurRadius: 50,
                        offset: const Offset(0, 20),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF00C6FF), Color(0xFF0072FF)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF0072FF).withValues(alpha: 0.4),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: const Icon(
                          CupertinoIcons.person_fill,
                          size: 45,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 28),
                      
                      Text(
                        "Benvenuto",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.8,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 10),
                      
                      Text(
                        "Come vuoi farti chiamare?",
                        style: TextStyle(
                          fontSize: 16,
                          color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 36),
                      
                      UniTextField(
                        controller: _name,
                        labelTesto: 'Nome',
                        hintText: "es. Enzo",
                        icona: CupertinoIcons.person,
                        width: double.infinity,
                      ),
                      const SizedBox(height: 40),
                      
                      Container(
                        width: double.infinity,
                        height: 56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: const LinearGradient(
                            colors: [Color(0xFF0072FF), Color(0xFF00C6FF)], 
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF0072FF).withValues(alpha: 0.3),
                              blurRadius: 15,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent, 
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          onPressed: () {
                            final name = _name.text.trim();
                            if (name.isNotEmpty) {
                              ref.read(modelProvider).setNome(name);
                            }
                          },
                          child: const Text(
                            "Inizia",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              letterSpacing: 0.3,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}