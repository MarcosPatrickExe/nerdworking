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
                    //        backgroundColor: AppColors.RED.color, 
                          )
                        );

                    }else if( this._passwordInput == "" ){
                        ScaffoldMessenger.of( buildContext ).showSnackBar(
                          SnackBar( 
                            content: const Text("O campo 'Senha' não pode estar vazio!"),
                  //          backgroundColor: AppColors.RED.color, 
                          ),
                        );

                    }else if( !this._emailInput.toString().contains('@')  ){
                        ScaffoldMessenger.of(buildContext).showSnackBar(
                          SnackBar( 
                            content: const Text("O campo 'E-mail' não contém o caractere '@' "),
                      //      backgroundColor: AppColors.RED.color, 
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


      bottomNavigationBar: BottomNavigationBar(

          currentIndex: 0,
          items: const <BottomNavigationBarItem>[

              BottomNavigationBarItem( 
                icon: Icon( Icons.add_circle ),
                label: "Criar conta"
              ),

              BottomNavigationBarItem( 
                icon:  Icon( Icons.info ),
                label: "Nossos contatos"
              ),
          ],
          onTap: (int index){
              print( " Indexxxx: "+index.toString() );

              if( index == 0 ){
                  Navigator.push( buildContext, MaterialPageRoute( builder: (context) => CreateUserAccount( ) ), );
              }else{
              
                showDialog<void>(
                  context: buildContext,
                  barrierDismissible: true,  // user must tap button!
                  builder: ( BuildContext dialogContext ){

                    return AlertDialog(
                    
                        content: Padding(
                          padding: const EdgeInsets.symmetric( horizontal: 12.0 ),
                          child: IntrinsicHeight(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [ 
                                    const SizedBox( height: 22.0, ),
                                    Container(
                                      constraints: BoxConstraints(
                                        maxHeight: MediaQuery.of(context).size.height *0.2,
                                        maxWidth: MediaQuery.of(context).size.width *0.2,
                                      ),
                                      child: Image.asset("assets/ic_sobre_logo.png"),
                                    ),
                                    const SizedBox( height: 17.0, ),
                                    const Text( "Todos os direitos reservados. ", style: TextStyle( fontSize: 16.0), ),
                                    const Text( "WhatsApp: (51) 98065-7000 ", style: TextStyle( fontSize: 13.0), ),
                                    const Text( "Call Center: (11) 4062-0139 ", style: TextStyle( fontSize: 13.0), ),
                                    const Text( "E-mail: sac@redeindustrial.com.br", style: TextStyle( fontSize: 13.0), ),
                                ]
                            ),
                          )
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {   Navigator.pop( dialogContext );  },
                            child: const Text("Ok", style: TextStyle( fontSize: 15.0 )),
                          ),
                        ],
                    );
                  }
                );
              }
              
          },
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



