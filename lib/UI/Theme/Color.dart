import 'package:flutter/material.dart';

class AppColors {
  // --- LIGHT MODE (Modalità Chiara) ---
  static const Color lightBackground = Color(0xFFF2F2F7); // Grigio system light
  static const Color lightSurface = Color(0xFFFFFFFF);     // Bianco puro
  static const Color lightTextPrimary = Color(0xFF000000); // Nero system
  static const Color lightTextSecondary = Color(0xFF3C3C43); // Grigio scuro testi

  // --- DARK MODE (Modalità Scura) ---
  static const Color darkBackground = Color(0xFF000000);   // Nero OLED puro
  static const Color darkSurface = Color(0xFF1C1C1E);      // Grigio scuro opaco
  static const Color darkTextPrimary = Color(0xFFFFFFFF);  // Bianco system
  static const Color darkTextSecondary = Color(0xFFEBEBF5); // Grigio chiaro

  // --- COLORI D'ACCENTO E SEMANTICI (iOS System Palette) ---
  static const Color systemBlue = Color(0xFF007AFF);       // Blu System (Azioni primarie)
  static const Color systemGreen = Color(0xFF34C759);      // Verde System (Esami superati / Obiettivi)
  static const Color systemRed = Color(0xFFFF3B30);        // Rosso System (Eliminazione / Errori)
}