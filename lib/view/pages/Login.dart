import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/FormFieldComponent.dart'; 
import '../../domain/model/Field.dart';
import '../../utils/Styles.dart';
import './CreateUserAccount.dart';
import '../../data/services/UserService.dart';
import '../../theme/AppThemeProvider.dart';
import '../../utils/AppConstants.dart';


class Login extends StatefulWidget{

  Login({ super.key });

  @override
  State<Login> createState() => _LoginState();
}




class _LoginState extends State<Login>{

  // EMAIL FIXO POR ENQUANTO !!!
  String _emailInput = "marcospatrick039474@gmail.com";
  String _passwordInput = "87153651";


  @override
  Widget build( BuildContext buildContext ){

    return Scaffold(
      // backgroundColor: Theme.of( buildContext ).colorScheme.surface,
      
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [ Theme.of( buildContext ).colorScheme.primaryContainer, Theme.of( buildContext ).colorScheme.primary, AppColors.BLUE_DARK.color ],
            begin: Alignment.bottomCenter,
            end:  Alignment.topRight ,
            stops: const [0.07, 0.2, 0.9],
          )
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric( horizontal: 60.0 ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height *0.2,
                    maxWidth: MediaQuery.of(context).size.width *0.2,
                  ),
                  child: Image.asset("nerdworking_512.png"),
                ),
                const SizedBox( height: 30.0 ),
                Text(
                  'Nerdworking', 
                  style:  TextStyle( 
                      color: Theme.of( context).colorScheme.onSurface,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox( height: 80.0 ), 
                FormFieldComponent.buildField( 
                  fieldView: const Field( 
                    "Email",
                    "e-mail", 
                    Icon ( Icons.email_outlined ), 
                    TextInputType.emailAddress
                  ), 
                  currentIndex: buildContext,
                  textChagedCallback: (String value ){  this._emailInput = value; },
                  maxLength: 320, // The maximum length for emails
                ),
                const SizedBox( height: 30.0 ),
                FormFieldComponent.buildField(  
                  fieldView: const Field(
                    "Senha",
                    "senha",
                    Icon ( Icons.password_rounded ),  
                    TextInputType.visiblePassword
                  ), 
                  currentIndex: buildContext,
                  textChagedCallback: (String value ){  this._passwordInput = value; },
                  maxLength: 30,
                ),
                const SizedBox( height: 70.0 ),
                Wrap(
                  alignment: WrapAlignment.center,
                  direction: Axis.horizontal,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * AppConstants.heightButtonRatio,
                      width: MediaQuery.of(context).size.width * AppConstants.widthButtonRatio,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            textStyle: WidgetStateProperty.all<TextStyle>( const TextStyle( color: Color.fromARGB(255, 255, 255, 255),  ) ),
                            backgroundColor: WidgetStateProperty.all<Color>( AppColors.WHITE.color ),
                            shape: WidgetStateProperty.all<OutlinedBorder>( //  MaterialStateProperty.all  ->  RoundedRectangleBorder(
                                const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all( Radius.circular(30.0) ),
                                )
                            ),
                        ),
                        onPressed: () async {

                          if( this._emailInput == "" ){
                              ScaffoldMessenger.of(buildContext).showSnackBar(
                                SnackBar( 
                                  content: const Text("O campo 'E-mail' não pode estar vazio!"),
                                  backgroundColor: Theme.of(buildContext).colorScheme.error, 
                                )
                              );

                          }else if( this._passwordInput == "" ){
                              ScaffoldMessenger.of( buildContext ).showSnackBar(
                                SnackBar( 
                                  content: const Text("O campo 'Senha' não pode estar vazio!"),
                                  backgroundColor: Theme.of(buildContext).colorScheme.error, 
                                ),
                              );

                          }else if( !this._emailInput.toString().contains('@')  ){
                              ScaffoldMessenger.of(buildContext).showSnackBar(
                                SnackBar( 
                                  content: const Text("O campo 'E-mail' não contém o caractere '@' "),
                                  backgroundColor: Theme.of(buildContext).colorScheme.error, 
                                )
                              );

                          }else{
                              await new UserService().loginService( this._emailInput,  this._passwordInput, buildContext );
                          }
                          
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon( Icons.login, ), // color: AppColors.WHITE.color 
                            const SizedBox( width: 10.0 ),
                            Text(
                              "Entrar",
                                style: TextStyle(
                                fontSize: 17.0, 
                                //  color: AppColors.WHITE.color,
                              ), 
                            ),
                          ]
                        ),
                      )
                    ),
                    
                    const SizedBox( width: 20.0 ),

                    Container(
                      height: MediaQuery.of(context).size.height *  AppConstants.heightButtonRatio,
                      width: MediaQuery.of(context).size.width * AppConstants.widthButtonRatio,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            textStyle: WidgetStateProperty.all<TextStyle>( const TextStyle( color: Color.fromARGB(255, 255, 255, 255),  ) ),
                            backgroundColor: WidgetStateProperty.all<Color>( AppColors.WHITE.color ),
                            shape: WidgetStateProperty.all<OutlinedBorder>( //  MaterialStateProperty.all  ->  RoundedRectangleBorder(
                                const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all( Radius.circular(30.0) ),
                                )
                            ),
                        ),
                        onPressed: (){
                          // Navigator.push( buildContext, MaterialPageRoute( builder: (context) => CreateUserAccount() ), );
                          Provider.of<AppThemeProvider>( super.context, listen: false ).toggleTheme();
                          print('\nTEMA ALTERADO PARA ${ Provider.of<AppThemeProvider>( buildContext, listen: false ).currentThemeData }'); 
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon( Icons.add, ),
                            const SizedBox( width: 10.0 ),
                            Text(
                              "Criar conta",
                              style: TextStyle(
                                fontSize: 17.0,
                              ), 
                            ),
                          ]
                        ),
                      )
                    ),
                    
                  ]
                ),
                
                
              ],
            ),
          )
        ),


      )
      /*
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
      */
    );
  }
}



