import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_colors.dart';

class AppTheme {
  AppTheme._();

  static final theme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.sidecar,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.burntSienna,
    ),
    useMaterial3: true,
    textTheme: GoogleFonts.anticSlabTextTheme(),
  );
}
