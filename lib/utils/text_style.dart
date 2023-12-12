import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyleCustom {
  static bold400({double? size, Color? color}) {
    return GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      fontSize: size,
      color: color,
    );
  }

  static bold500({double? size, Color? color}) {
    return GoogleFonts.poppins(
      fontWeight: FontWeight.w500,
      fontSize: size,
      color: color,
    );
  }

  static bold600({double? size, Color? color}) {
    return GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      fontSize: size,
      color: color,
    );
  }
}
