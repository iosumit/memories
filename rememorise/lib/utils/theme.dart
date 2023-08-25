import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData buildTheme(brightness) {
  var baseTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
  );

  return baseTheme.copyWith(
    textTheme: GoogleFonts.mulishTextTheme(baseTheme.textTheme),
  );
}
