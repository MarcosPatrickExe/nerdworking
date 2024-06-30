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
        colorSchemeSeed: const Color.fromARGB(255, 58, 179, 183),  //ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 58, 179, 183)),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: const Color.fromARGB(84, 136, 2, 214),
      ),

      themeMode: _currentTheme,  //ThemeMode.light,

      home:  Login( ),
    );

  }
}
