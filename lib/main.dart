import 'package:flutter/material.dart';
import 'package:nerdworking/utils/Styles.dart';
import './view/pages/Login.dart';



void main() {
  runApp( const SettingAppTheme() );
}


class SettingAppTheme extends StatefulWidget {
  const SettingAppTheme({ super.key });

  @override
  State<SettingAppTheme> createState () => _SettingAppThemeState();
}




class _SettingAppThemeState extends State<SettingAppTheme> {
  

  final ThemeMode _currentTheme = ThemeMode.light;


  static final _lightColorScreen = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.BLUE.color, // appbar color
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: AppColors.BLUE_MEDIUM.color,
    onPrimaryContainer:  AppColors.WHITE.color, 
    secondary: AppColors.BLUE_MEDIUM.color, //Color(0xFF735761),
    onSecondary: AppColors.WHITE.color,  // AppColors.ORANGE.color, 
    error: AppColors.RED.color, 
    onError: AppColors.WHITE.color, 
    surface: AppColors.SKYBLUE.color,    // appbar color
    onSurface: AppColors.BLUE_MEDIUM.color,
  );



  static final _darkTheme = ColorScheme(
  
    brightness: Brightness.dark,
    primary: AppColors.BLUE_MEDIUM.color,  //appbar color
    onPrimary: Color(0xFFFFFFFF),  // Color(0xFFFFB0D0), // appbar text
    primaryContainer: AppColors.BLUE.color, 
    onPrimaryContainer: Color(0xFFFFD8E6),
    secondary: AppColors.BLUE.color, // float action button
    onSecondary: AppColors.WHITE.color,  // float action button text
    error: AppColors.RED.color, 
    onError: AppColors.WHITE.color, 
    surface: AppColors.BLUE_DARK.color, // is background color
    onSurface: AppColors.MY_PRIMARY_COLOR.color,
  );




  @override
  Widget build( BuildContext context ) {

    return MaterialApp(
      title: 'My Nerdworking',
      
      theme: ThemeData(
      //  colorSchemeSeed: Color.fromARGB(255, 48, 110, 245),  //ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 58, 179, 183)),
  //      primaryColor: AppColors.WHITE_PRIMARY_COLOR.color,
    //    primaryColorLight: AppColors.ORANGE.color,
   //     scaffoldBackgroundColor: AppColors.GREEN_DARK.color,
        useMaterial3: false,
        colorScheme: _lightColorScreen,
      ),
      darkTheme: ThemeData(
       // colorSchemeSeed: Color.fromARGB(82, 22, 233, 3),
        useMaterial3: false,
        colorScheme: _darkTheme,
      ),

      themeMode: _currentTheme,  //ThemeMode.light,

      home:  Login( ),
    );

  }
}