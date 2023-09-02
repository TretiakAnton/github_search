import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const String apiKey = '96bc4f42f4b0c861ed2e623189ccadc3';
const String baseUrl = 'https://api.github.com/search/repositories';

class SearchColors {
  static const main = Color.fromRGBO(249, 249, 249, 1);
  static const layer1 = Color.fromRGBO(242, 242, 242, 1);
  static const accentPrimary = Color.fromRGBO(20, 99, 245, 1);
  static const accentSecondary = Color.fromRGBO(229, 237, 255, 1);
  static const textPrimary = Color.fromRGBO(33, 24, 20, 1);
  static const textPlaceholder = Color.fromRGBO(191, 191, 191, 1);
}

class SearchTextStyles {
  static TextStyle get header {
    return GoogleFonts.raleway(
      color: SearchColors.textPrimary,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle get body {
    return GoogleFonts.raleway(
      color: SearchColors.textPrimary,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    );
  }
}
