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
  

  final ThemeMode _currentTheme = ThemeMode.light;


  @override
  Widget build( BuildContext context ) {

    return MaterialApp(
      title: 'Flutter Demo',
      
      theme: ThemeData(
        brightness: Brightness.light,
        colorSchemeSeed: Color.fromARGB(255, 48, 110, 245),  //ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 58, 179, 183)),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: Color.fromARGB(82, 22, 233, 3),
        useMaterial3: true,
      ),

      themeMode: _currentTheme,  //ThemeMode.light,

      home:  Login( ),
    );

  }
}
