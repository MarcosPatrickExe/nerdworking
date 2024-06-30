import 'package:flutter/material.dart';
import '../components/FormFieldComponent.dart';
import '../../domain/model/Field.dart';
import '../../utils/Styles.dart';
import './CreateUserAccount.dart';



class Login extends StatefulWidget{

  Login({ super.key });

  @override
  State<Login> createState() => _LoginState();
}




class _LoginState extends State<Login>{
  String _emailInput = "marcospatrick039474@gmail.com";
  String _passwordInput = "87153651";


  @override
  Widget build( BuildContext buildContext ){

    return Scaffold(
      
      backgroundColor: Theme.of( buildContext ).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of( buildContext ).colorScheme.primary,
        centerTitle: true,
        title: Text("Login"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric( horizontal: 60.0 ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            //  Image.asset("assets/ic_launcher.png"),
              const SizedBox( height: 30.0 ),
              Text(
                'Nerdworking',
                style: TextStyle( color: Theme.of( context).colorScheme.onSurface  ),
              ),
              const SizedBox( height: 80.0 ),
              FormFieldComponent.buildField( 
              
                fieldView: const Field(
                  "Email",
                  "e-mail",
                  Icon ( Icons.email_outlined ),
                  TextInputType.emailAddress
                ), 
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
                textChagedCallback: (String value ){  this._passwordInput = value; },
                maxLength: 30,
              ),
              const SizedBox( height: 70.0 ),
              Container(
                height: MediaQuery.of(context).size.height *0.065,
                width: MediaQuery.of(context).size.width *0.351,
                child: ElevatedButton(
                  style: ButtonStyle(
                      textStyle: WidgetStateProperty.all<TextStyle>( const TextStyle( color: Color.fromARGB(255, 255, 255, 255),  ) ),
                  //    backgroundColor: WidgetStateProperty.all<Color>( AppColors.RED.color ),
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
                      //  await new UserService().userLogin( this._emailInput,  this._passwordInput, buildContext );
                    }
                    
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Icon( Icons.login, // color: AppColors.WHITE.color 
                        ),
                        const SizedBox( width: 10.0 ),
                        Text(
                          "Entrar",
                          style: TextStyle(
                              fontSize: 20.0, 
                      //        color: AppColors.WHITE.color,
                          ), 
                        ),
                    ]
                  ),
                )
              )
              
            ],
          ),
        )
      ),


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



