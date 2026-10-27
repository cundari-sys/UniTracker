import 'package:flutter/material.dart';

class UniTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? labelTesto;
  final IconData? icona;
  final double? width;

  const UniTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.labelTesto,
    this.icona,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    Widget field = Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16.0), 
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.transparent : Colors.black.withValues(alpha: 0.03), 
            blurRadius: 20, 
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        cursorColor: theme.colorScheme.primary,
        cursorWidth: 2.0,
        cursorRadius: const Radius.circular(2), 
        style: theme.textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w500, 
        ),
        decoration: InputDecoration(
          labelText: labelTesto?.toUpperCase(),
          labelStyle: TextStyle(
            fontSize: 13, 
            fontWeight: FontWeight.w800, 
            letterSpacing: 1.5,
            color: isDark ? Colors.grey.shade500 : Colors.grey.shade400,
          ),
          floatingLabelStyle: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.5,
            color: theme.colorScheme.primary, 
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          
          hintText: hintText,
          hintStyle: TextStyle(
            color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.4), 
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: icona != null 
              ? Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 12.0), 
                  child: Icon(
                    icona, 
                    color: theme.colorScheme.primary.withValues(alpha: 0.8), 
                    size: 20,
                  ),
                ) 
              : null,
          filled: true,
          fillColor: Colors.transparent, 
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18), 
          
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide(
              color: isDark 
                  ? Colors.white.withValues(alpha: 0.08) 
                  : Colors.black.withValues(alpha: 0.04), 
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide(
              color: theme.colorScheme.primary.withValues(alpha: 0.8), 
              width: 1.5, 
            ),
          ),
        ),
      ),
    );

    if (width != null) {
      return SizedBox(
        width: width,
        child: field,
      );
    }

    return field;
  }
}