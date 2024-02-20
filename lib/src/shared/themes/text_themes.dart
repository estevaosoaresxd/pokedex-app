import "package:flutter/material.dart";

class TextThemes {
  static TextTheme theme = TextTheme(
    titleLarge: const TextStyle(
      color: Colors.black,
      fontSize: 26,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: const TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: const TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: const TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    labelMedium: TextStyle(
      color: Colors.grey[700],
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: TextStyle(
      color: Colors.grey[700],
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    labelSmall: const TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  );
}
