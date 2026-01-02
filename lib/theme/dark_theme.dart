import 'package:flutter/material.dart';
import 'custom_theme_colors.dart';

ThemeData darkTheme = ThemeData(
  fontFamily: 'SFProText',

  // 🔵 Cor primária (AZUL)
  primaryColor: const Color(0xFF2746F5),
  primaryColorDark: const Color(0xFF1A2FC1),

  brightness: Brightness.dark,
  cardColor: const Color(0xFF242424),
  hintColor: const Color(0xFF9F9F9F),
  scaffoldBackgroundColor: const Color(0xFF1C1F1F),

  extensions: <ThemeExtension<CustomThemeColors>>[
    CustomThemeColors.dark(),
  ],

  colorScheme: const ColorScheme.dark(
    // 🔵 Principais
    primary: Color(0xFF2746F5),
    secondary: Color(0xFF6B82FF),

    // Containers / variações
    primaryContainer: Color(0xFF1A2FC1),
    secondaryContainer: Color(0xFF3D52E0),

    // Estados
    error: Color(0xFFFF6767),

    // Extras mantidos
    tertiary: Color(0xFF7CCD8B),
    tertiaryContainer: Color(0xFFC98B3E),
    onTertiary: Color(0xFFD9D9D9),
    onTertiaryContainer: Color(0xFF425956),

    onPrimary: Color(0xFFFFFFFF),
    onPrimaryContainer: Color(0xFFE8ECFF),
    onSecondary: Color(0xFFFFFFFF),
    onSecondaryContainer: Color(0xFFD6DCFF),

    outline: Color(0xFF6B82FF),
    onSurface: Color(0xFFFFE6AD),

    surfaceContainer: Color(0xFF12162A),
    secondaryFixedDim: Color(0xFF808080),
  ),

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: const Color(0xFF2746F5),
    ),
  ),

  textTheme: const TextTheme(
    displayLarge:
        TextStyle(fontWeight: FontWeight.w300, color: Color(0xFFECECEC)),
    displayMedium:
        TextStyle(fontWeight: FontWeight.w300, color: Color(0xFFD6D6D6)),
    displaySmall:
        TextStyle(fontWeight: FontWeight.w300, color: Color(0xFFCFCFCF)),
    bodyLarge:
        TextStyle(fontWeight: FontWeight.w300, color: Color(0xFFE0E0E0)),
    bodyMedium:
        TextStyle(fontWeight: FontWeight.w300, color: Color(0xFFFFFFFF)),
    bodySmall:
        TextStyle(fontWeight: FontWeight.w300, color: Color(0xFFB0B0B0)),
  ),
);
