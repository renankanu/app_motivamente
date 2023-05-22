import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static final theme = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFE96C6A),
    ),
    useMaterial3: true,
    textTheme: GoogleFonts.anticSlabTextTheme(),
  );
}
