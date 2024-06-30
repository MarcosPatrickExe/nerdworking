import 'package:flutter/material.dart';



enum AppColors{

  PURPLE_LIGHT( Color.fromARGB(255, 113, 3, 185) ),
  PURPLE_DARK( Color.fromARGB(255, 113, 3, 185) ),
  WHITE( Color.fromARGB(255, 255, 255, 255) ),
  GRAY(  Color.fromARGB(255, 110, 120, 110)  ),
  GRAY_TRANSPARENT(  Color.fromARGB(155, 110, 120, 110)  ),
  TEXT_BLACK(  Color.fromARGB(180, 0, 0, 0)  ),
  GREEN( Color.fromARGB(255, 23, 133, 2) ),
  RED( Color.fromRGBO(234, 67, 53, 1.0) );


  const AppColors( this.color );
  final Color color;
}





