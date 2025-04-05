import 'package:flutter/material.dart'; 
import '../utils/Styles.dart';      
   
    
// DEFAULT THEME COLOR!
final ThemeData _darkTheme = ThemeData(
    
  colorScheme: ColorScheme(  
    brightness: Brightness.dark,
    primary: AppColors.BLUE_MEDIUM.color, //appbar color 
    onPrimary: Color(0xFFFFFFFF), // Color(0xFFFFB0D0), // appbar text
    primaryContainer: AppColors.BLUE.color, 
    onPrimaryContainer: Color(0xFFFFD8E6),
    secondary: AppColors.BLUE.color, // float action button
    onSecondary: AppColors.WHITE.color, // float action button text
    error: AppColors.RED.color,
    onError: AppColors.WHITE.color,
    surface: AppColors.BLUE_DARK.color, // is background color
    onSurface: AppColors.MY_PRIMARY_COLOR.color,
    tertiaryFixed: AppColors.BLUE_MEDIUM.color,
  ), 
  // useMaterial3: true,
);


final ThemeData _lightTheme = ThemeData(
  //  colorSchemeSeed: Color.fromARGB(255, 48, 110, 245),  //ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 58, 179, 183)),
  //  primaryColor: AppColors.WHITE_PRIMARY_COLOR.color,
  //  primaryColorLight: AppColors.ORANGE.color,
  //  scaffoldBackgroundColor: AppColors.GREEN_DARK.color,
  //  colorSchemeSeed: AppColors.PURPLE_LIGHT.color,
  //  colorScheme: _lightColorScreen,
  //  useMaterial3: true,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.RED.color, // appbar color
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: AppColors.RED.color,
    onPrimaryContainer: AppColors.WHITE.color,
    secondary: AppColors.BLUE_MEDIUM.color, //Color(0xFF735761),
    onSecondary: AppColors.WHITE.color, // AppColors.ORANGE.color,
    error: AppColors.RED.color,
    onError: AppColors.WHITE.color,
    surface: AppColors.GRAY_SOFT.color, // AppColors.SKYBLUE.color,    // appbar color
    onSurface: AppColors.RED.color,
    tertiaryFixed: AppColors.SKYBLUE_TEXT_HINT.color,
  )
);



class AppThemeProvider extends ChangeNotifier {
  // ThemeMode _themeMode = ThemeMode.light;
  // ThemeMode get currentThemeMode => _themeMode;

  ThemeData currentThemeData = _lightTheme;

  void toggleTheme() {
    this.currentThemeData = (this.currentThemeData == _lightTheme) ? _darkTheme : _lightTheme;
    notifyListeners();
     // this._themeMode = ( this._themeMode == ThemeMode.light) ? ThemeMode.dark : ThemeMode.light;
  }
}
