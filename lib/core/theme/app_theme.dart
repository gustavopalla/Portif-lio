import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AppTheme {
  // Cores Principais
  static const Color pureBlack = Color(0xFF000000);
  static const Color vibrantYellow = Color(0xFF007AFF);
  static const Color darkGrey = Color(0xFF121212);
  static const Color lightGrey = Color(0xFFBBBBBB);

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: pureBlack,
      primaryColor: vibrantYellow,
      colorScheme: const ColorScheme.dark(
        primary: vibrantYellow,
        secondary: vibrantYellow,
        surface: darkGrey,
        background: pureBlack,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(
        ThemeData.dark().textTheme,
      ).copyWith(
        displayLarge: GoogleFonts.poppins(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 48,
        ),
        bodyLarge: GoogleFonts.poppins(
          color: lightGrey,
          fontSize: 16,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: vibrantYellow,
          foregroundColor: pureBlack,
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // Botões ovais conforme PRD
          ),
        ),
      ),
    );
  }
}
