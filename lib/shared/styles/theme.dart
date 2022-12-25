import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mini_projet/shared/styles/colors.dart';

class Themes{
  static final lightTheme=ThemeData(
      fontFamily: 'Metropolis',
      primarySwatch: AppColors.mainSwatchColor,
      appBarTheme:  AppBarTheme(
          actionsIconTheme: IconThemeData(color: AppColors.mainColor,size: 20),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize:24,
          ),
          iconTheme: IconThemeData(color: AppColors.mainColor),
          elevation: 0,
          color: Colors.white,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          )
      ),

      textTheme:  TextTheme(
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        bodyMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
        bodySmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
        ),
      ),
      scaffoldBackgroundColor: Colors.white,
      bottomNavigationBarTheme:BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          unselectedItemColor: AppColors.greyColor
      )
  );

}