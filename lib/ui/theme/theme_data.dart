import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Gradients
const secondaryGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    colorSecondary,
    colorSecondaryShade,
  ],
);

const primaryGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    colorPrimaryLight,
    colorPrimary,
  ],
);

const backgroundGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    colorBgLight,
    colorBgWhite,
  ],
);

//Backgrounds
const colorBgLight = Color(0xffebf3fc);
const colorBg = Color(0xffd8e4f4);
const colorBgWhite = Color(0xffffffff);

//Fonts
const standFont = 'DM Sans';
const mainTitleFont = "DM Sans";
const bodyFont = "DM Sans";

//General Colors
const colorSecondary = Color(0xFFd20030);
const colorSecondaryLight = Color(0xffF84971);
const colorSecondaryShade = Color(0xff9d0020);

const colorSecondaryContainer = Color(0xff47B489);

const colorPrimary = Color(0xFF2e5899);
const colorPrimaryLight = Color(0xFF2E6FC5);
const colorPrimaryShade = Color(0xff22457B);
const colorPrimaryDark = Color(0xFF172C4B);
const colorPrimaryContainerLight = Color(0xFFEDF6FF);
const colorPrimaryContainer = Color(0xFFDFECF9);

//Button Decoration Colors
const colorBtnBorder = Color(0x75FFFFFF);
const colorBtnTxt = Color(0xADC39292);
const colorBtnTxtLight = Color(0xC8ECE7E7);

ThemeData defaultTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: colorPrimary,
      onPrimary: colorPrimaryLight,
      primaryContainer: colorPrimaryContainer,
      onPrimaryContainer: colorPrimaryContainerLight,
      secondary: colorSecondary,
      onSecondary: colorSecondaryLight,
      secondaryContainer: colorSecondaryContainer,
      tertiary: colorPrimaryShade,
      onTertiary: colorPrimaryDark,
      background: Colors.white,
      onBackground: Colors.white,
      surface: colorPrimaryDark,
      onSurface: Colors.white,
      error: Color(0xFFDB004D),
      onError: Color(0xA1DB004D),
    ),
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: MaterialStateProperty.all(colorPrimary),
    ),

    /////
    textTheme: TextTheme(
      //Títulos claros

      displayLarge: TextStyle(
          color: Colors.white,
          fontFamily: GoogleFonts.getFont(standFont).fontFamily,
          fontWeight: FontWeight.w900,
          fontSize: 50.0,
          letterSpacing: -0.25),

      displayMedium: TextStyle(
          color: Colors.white,
          fontFamily: GoogleFonts.getFont(standFont).fontFamily,
          fontWeight: FontWeight.w800,
          fontSize: 28.0,
          letterSpacing: -0.25),

      //Títulos de rows
      headlineLarge: TextStyle(
          color: colorPrimary,
          fontFamily: GoogleFonts.getFont(standFont).fontFamily,
          fontWeight: FontWeight.w700,
          fontSize: 28.0,
          letterSpacing: -0.25),
      headlineMedium: TextStyle(
          color: colorPrimaryShade,
          fontFamily: GoogleFonts.getFont(standFont).fontFamily,
          fontWeight: FontWeight.w700,
          fontSize: 22.0,
          height: 0.8,
          letterSpacing: -0.25),

      //Basic Page Header Title
      headlineSmall: TextStyle(
        color: colorSecondary,
        fontFamily: GoogleFonts.getFont(standFont).fontFamily,
        fontWeight: FontWeight.bold,
        fontSize: 40,
        letterSpacing: -1,
      ),
      //Títulos de headers para páginas básicas

      //H2
      titleLarge: TextStyle(
        color: colorPrimary,
        fontFamily: GoogleFonts.getFont(standFont).fontFamily,
        fontWeight: FontWeight.bold,
        fontSize: 24,
        letterSpacing: 0.25,
      ),

      //H3
      titleMedium: TextStyle(
        color: colorPrimary,
        fontFamily: GoogleFonts.getFont(bodyFont).fontFamily,
        fontWeight: FontWeight.bold,
        fontSize: 18,
        letterSpacing: -0.25,
      ),
      titleSmall: TextStyle(
        color: colorPrimaryDark,
        fontFamily: GoogleFonts.getFont(bodyFont).fontFamily,
        fontWeight: FontWeight.bold,
        fontSize: 16,
        letterSpacing: -1.5,
      ),
      // headlineSmall: TextStyle(
      //     color: colorPrimary,
      //     fontFamily: GoogleFonts.getFont(bodyFont).fontFamily,
      //     fontWeight: FontWeight.bold,
      //     fontSize: 15.0,
      //     height: 0.8,
      //     letterSpacing: -0.50),

      // Body
      bodyLarge: TextStyle(
        color: colorPrimary,
        fontFamily: GoogleFonts.getFont(bodyFont).fontFamily,
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.25,
        height: 1.5,
      ),
      bodyMedium: TextStyle(
        color: colorPrimaryDark,
        fontFamily: GoogleFonts.getFont(bodyFont).fontFamily,
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.25,
        height: 1.5,
      ),
    ),

    // E S T I L O S   D E   B O T O N E S
    // Text Button
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      textStyle: MaterialStateProperty.all(TextStyle(
          color: Colors.white,
          fontFamily: GoogleFonts.getFont(standFont).fontFamily,
          fontWeight: FontWeight.w500)),
    )),

    // Elevated Button
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      elevation: MaterialStateProperty.all(8.0),
      textStyle: MaterialStateProperty.all(TextStyle(
          color: colorBtnTxt,
          fontFamily: GoogleFonts.getFont(standFont).fontFamily,
          fontWeight: FontWeight.w600)),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      side: MaterialStateProperty.all(
        const BorderSide(
          width: 5.0,
          color: colorBtnBorder,
        ),
      ),
      backgroundColor: MaterialStateProperty.all(colorSecondary),
    )));
