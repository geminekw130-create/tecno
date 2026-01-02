import 'package:flutter/material.dart';
import 'package:motoboy/theme/custom_theme_colors.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'SFProText',

  // 🔵 Cor primária (AZUL)
  primaryColor: const Color(0xFF2746F5),
  primaryColorDark: const Color(0xFF1F36C4),

  disabledColor: const Color(0xFFBABFC4),
  brightness: Brightness.light,
  hintColor: const Color(0xFF9F9F9F),
  cardColor: Colors.white,

  extensions: <ThemeExtension<CustomThemeColors>>[
    CustomThemeColors.light(),
  ],

  colorScheme: const ColorScheme.light(
    // 🔵 Principais
    primary: Color(0xFF2746F5),
    secondary: Color(0xFF4D6CFA),

    // Containers / variações
    primaryContainer: Color(0xFFDEE4FF),
    secondaryContainer: Color(0xFFB8C5FF),

    // Superfícies
    surface: Color(0xFFF3F3F3),
    surfaceTint: Color(0xFF2746F5),
    surfaceContainer: Color(0xFFE9EDFF),

    // Estados
    error: Color(0xFFFF6767),
    errorContainer: Color(0xFFF6F6F6),
    onErrorContainer: Color(0xFFFFE6AD),

    // Extras mantidos
    tertiary: Color(0xFF7CCD8B),
    tertiaryContainer: Color(0xFFC98B3E),
    onTertiary: Color(0xFFD9D9D9),
    onTertiaryContainer: Color(0xFF425956),

    onPrimary: Color(0xFFFFFFFF),
    onPrimaryContainer: Color(0xFF1A237E),
    onSecondary: Color(0xFFFFFFFF),
    onSecondaryContainer: Color(0xFF1A237E),

    outline: Color(0xFF9AA7FF),
    shadow: Color(0xFFD6DCFF),

    secondaryFixedDim: Color(0xFF808080),
  ),

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: const Color(0xFF2746F5),
    ),
  ),

  textTheme: const TextTheme(
    displayLarge:
        TextStyle(fontWeight: FontWeight.w300, color: Color(0xFF202020)),
    displayMedium:
        TextStyle(fontWeight: FontWeight.w300, color: Color(0xFF393939)),
    displaySmall:
        TextStyle(fontWeight: FontWeight.w300, color: Color(0xFF282828)),
    bodyLarge:
        TextStyle(fontWeight: FontWeight.w300, color: Color(0xFF272727)),
    bodyMedium:
        TextStyle(fontWeight: FontWeight.w300, color: Color(0xFF334257)),
    bodySmall:
        TextStyle(fontWeight: FontWeight.w300, color: Color(0xFF1D2D2B)),
  ),
);
