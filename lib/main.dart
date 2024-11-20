import 'package:flutter/material.dart'; 
import 'package:nerdworking/utils/Styles.dart';
import 'package:provider/provider.dart';
import './view/pages/Login.dart';
import 'theme/AppThemeProvider.dart';


void main() {
  runApp( ChangeNotifierProvider(
    create: (_)=> AppThemeProvider(),
    child: const SettingAppTheme(),
  ) );
} 


class SettingAppTheme extends StatefulWidget {
  const SettingAppTheme({ super.key });

  @override
  State<SettingAppTheme> createState () => _SettingAppThemeState();
}




class _SettingAppThemeState extends State<SettingAppTheme> {

    final ThemeMode _currentTheme = ThemeMode.dark;

    // DEFAULT THEME COLOR!
    static final _darkTheme = ThemeData(

        colorScheme: ColorScheme(
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
            tertiaryFixed: AppColors.BLUE_MEDIUM.color,
      ),
      
    // useMaterial3: true,
    );



    static final _lightTheme = ThemeData(
        //  colorSchemeSeed: Color.fromARGB(255, 48, 110, 245),  //ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 58, 179, 183)),
        //  primaryColor: AppColors.WHITE_PRIMARY_COLOR.color,
        //  primaryColorLight: AppColors.ORANGE.color,
        //  scaffoldBackgroundColor: AppColors.GREEN_DARK.color,
        //  colorSchemeSeed: AppColors.PURPLE_LIGHT.color,
        //  colorScheme: _lightColorScreen,
        useMaterial3: true,
    
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: AppColors.RED.color, // appbar color
          onPrimary: Color(0xFFFFFFFF),
          primaryContainer: AppColors.RED.color,
          onPrimaryContainer:  AppColors.WHITE.color, 
          secondary: AppColors.BLUE_MEDIUM.color, //Color(0xFF735761),
          onSecondary: AppColors.WHITE.color,  // AppColors.ORANGE.color, 
          error: AppColors.RED.color, 
          onError: AppColors.WHITE.color, 
          surface: AppColors.GRAY_SOFT.color,// AppColors.SKYBLUE.color,    // appbar color
          onSurface: AppColors.RED.color,
          tertiaryFixed: AppColors.SKYBLUE_TEXT_HINT.color,
        )
    );



    @override
    Widget build( BuildContext context ) {

      return MaterialApp(
        title: 'Nerdworking',  // of title bar for web execution
        theme: Provider.of<AppThemeProvider>(context ).currentThemeData ,
      //  theme: _SettingAppThemeState._lightTheme,
      // darkTheme: _SettingAppThemeState._darkTheme,
      // themeMode: _currentTheme,  //ThemeMode.light,
        home:  Login( ),
      );

    }
}
