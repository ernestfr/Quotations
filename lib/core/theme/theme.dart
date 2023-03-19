import 'package:flutter/material.dart';
import 'package:quotations/core/theme/colors.dart';

var themeData = ThemeData(
  fontFamily: "WorkSans",
  colorSchemeSeed: primaryColor,
  useMaterial3: true,
  cardColor: cardColor,
  scaffoldBackgroundColor: backgroundColor,
  dividerTheme: DividerThemeData(color: primaryColor, thickness: 1.5),
  splashColor: primaryColor.withOpacity(0.25),
  textSelectionTheme: TextSelectionThemeData(
      cursorColor: primaryColor,
      selectionColor: primaryColor.withOpacity(0.25),
      selectionHandleColor: primaryColor),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(),
    focusedErrorBorder:
        OutlineInputBorder(borderSide: BorderSide(color: errorColor, width: 2)),
    errorBorder: OutlineInputBorder(borderSide: BorderSide(color: errorColor)),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
    foregroundColor: secondaryColor,
  ),
);
