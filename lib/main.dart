import 'package:flutter/material.dart';  
import 'package:nerdworking/utils/Styles.dart';     
import 'package:provider/provider.dart';     
import './view/pages/Login.dart';         
import 'theme/AppThemeProvider.dart';           
 
void runnerTest(){
     print("task runner seven");
}

void main() {   
  runApp( ChangeNotifierProvider(
    create: (_)=> AppThemeProvider(),  
    child: const SettingAppTheme(), 
  ) );
}      
 
 

class SettingAppTheme extends StatelessWidget {  // hierarquia
  const SettingAppTheme({ super.key });
  
  @override
  Widget build( BuildContext context ) {

    return MaterialApp(
      title: 'Nerdworking',  // of title bar for web execution 
      theme: Provider.of<AppThemeProvider>(context ).currentThemeData ,
      home:  Login( ),
    );

  } 
}
