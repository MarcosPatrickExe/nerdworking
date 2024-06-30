import 'package:flutter/material.dart';
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
  

  ThemeMode _currentTheme = ThemeMode.system;


  @override
  Widget build( BuildContext context ) {

    return MaterialApp(
      title: 'Flutter Demo',
      
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: const Color.fromRGBO(86, 80, 14, 171),
      ),

      themeMode: _currentTheme,  //ThemeMode.light,

      home:  Login( ),
    );

  }
}
