import 'package:flutter/material.dart';

  
 
enum AppColors{

  // for White THEME:
  MY_PRIMARY_COLOR( Color.fromARGB(255, 23, 133, 2)  ),
  GREEN_DARK( Color.fromARGB(255, 14, 80, 1)  ), 
  PURPLE_LIGHT( Color.fromARGB(255, 113, 3, 185) ), 
  PURPLE_DARK( Color.fromARGB(255, 113, 3, 185) ),
  WHITE( Color.fromARGB(255, 255, 255, 255) ), 
  GRAY(  Color.fromARGB(255, 110, 120, 110)  ),
  GRAY_SOFT(  Color.fromARGB(255, 216, 216, 216)  ),
  GRAY_TRANSPARENT(  Color.fromARGB(135, 110, 120, 110)  ), 
  TEXT_BLACK(  Color.fromARGB(180, 0, 0, 0)  ),
  GREEN( Color.fromARGB(255, 23, 133, 2) ),
  RED( Color.fromRGBO(234, 67, 53, 1.0) ),
  ORANGE( Color.fromRGBO(243, 153, 35, 1) ),
  BLUE( Color.fromRGBO( 9, 130, 255, 1) ),
  SKYBLUE( Color.fromRGBO( 118, 213, 254, 1) ),
  SKYBLUE_TEXT_HINT( Color.fromRGBO(64, 160, 201, 0.7) ),
  BLUE_MEDIUM( Color.fromRGBO( 3, 92, 194, 1) ),
  BLUE_DARK( Color.fromRGBO(1, 43, 92, 1) );
 

  const AppColors( this.color );
  final Color color;
}


