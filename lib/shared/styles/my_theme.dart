import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

class MyThemeData {



  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor:lightGreenColor,
      secondaryHeaderColor: Color(0xFF242424),

      textTheme: TextTheme(
          bodyLarge: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,),

          bodyMedium: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: lightColor),

        bodySmall: GoogleFonts.roboto(
            fontSize: 15,
            fontWeight: FontWeight.normal,
            color: Colors.black54),

      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.shifting,
        selectedItemColor:lightColor,
        unselectedItemColor: Colors.grey.shade400,

      ),


      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Color(0xFF242424)),
          backgroundColor: lightColor,
          ));
  static ThemeData darkTheme = ThemeData();
}
