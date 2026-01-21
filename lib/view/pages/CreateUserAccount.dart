import 'package:flutter/material.dart';
import 'package:nerdworking/view/components/UserTypesDialog.dart';
import '../../view/components/FormFieldComponent.dart';
import '../../domain/model/Field.dart'; 
import '../../utils/Types.dart';
import '../../data/services/UserService.dart';




class CreateUserAccount extends StatefulWidget{

  CreateUserAccount({ super.key });

  @override
  State<CreateUserAccount> createState() => CreateUserAccountState();
}




class CreateUserAccountState extends State<CreateUserAccount>{

  String _nicknameInput ="";
  String _emailInput = "";
  // String _avatar = "";
  String _passwordInput ="";
  UserType _userType = UserType.NOT_DEFINED;



  List<Map< String, dynamic>> optionsSelected = [
    { "name" : "Otaku",        "isChecked" :false  },
    { "name" : "Cinéfilo(a)",   "isChecked" :false},
    { "name" : "Streamer",       "isChecked" :false },
    { "name" : "Animador(a)",     "isChecked" :false },
    { "name" : "Gamer",             "isChecked" :false },
    { "name" : "Desenvolvedor(a)",   "isChecked" :false},
    { "name":  "Testador(a)",          "isChecked" :false },
    { "name" : "Designer",              "isChecked" :false },
    { "name" : "Gestor(a) de projetos ",   "isChecked" :false },
    { "name" : "Animador(a)",               "isChecked" :false },
    { "name" : "Outro",                       "isChecked" :false },
  ];



  @override
  Widget build( BuildContext createUserAccountContext ){
  

    return Scaffold(
      backgroundColor: Theme.of( createUserAccountContext ).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of( createUserAccountContext ).colorScheme.primary,
        centerTitle: true,
        title: Text("Criar conta gratuita"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric( horizontal: 60.0 ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              const SizedBox( height: 40.0 ),
              FormFieldComponent.buildField( 
                fieldView: const Field(
                  "Nickname",
                  "seu nickname",
                  Icon ( Icons.text_fields ),
                  TextInputType.emailAddress
                ), 
                currentIndex: createUserAccountContext,
                textChagedCallback: (String value ){  this._nicknameInput = value; },
                maxLength: 100, // The maximum length for emails
              ),
              const SizedBox( height: 30.0 ),
              FormFieldComponent.buildField( 
                fieldView: const Field(
                  "Email",
                  "e-mail",
                  Icon ( Icons.email_outlined ),
                  TextInputType.emailAddress
                ), 
                currentIndex: createUserAccountContext,
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
                currentIndex: createUserAccountContext,
                textChagedCallback: (String value ){  this._passwordInput = value; },
                maxLength: 40,
              ),
              
              const SizedBox( height: 40.0 ),


              Row( 
                children: [
                  Text(
                    "Qual o seu perfil? ", 
                    style: TextStyle(
                      color: Theme.of( createUserAccountContext ).colorScheme.onSurface,
                    )
                  ),
                  SizedBox( width: 20.0, ),
                  ElevatedButton( 
                      style: ButtonStyle(
                        textStyle: WidgetStateProperty.all<TextStyle>(  TextStyle( color: Theme.of( createUserAccountContext).colorScheme.onSecondary,)  ),
                        backgroundColor: WidgetStateProperty.all<Color>( Theme.of( createUserAccountContext).colorScheme.secondary, ),
                        shape: WidgetStateProperty.all<OutlinedBorder>( //  MaterialStateProperty.all  ->  RoundedRectangleBorder(
                          const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all( Radius.circular(30.0) ),
                          )
                        ),
                      ),
                      onPressed: (){
                          showDialog<void>(
                            context: createUserAccountContext,
                            barrierDismissible: true,  
                            builder: ( BuildContext dialogContext ){
                                return UserTypesDialog( parentContext: createUserAccountContext, parentWidget: this  );
                            }
                          );
                      }, 
                      child: Row(children: [  Text("selecionar"), Icon( Icons.ads_click)  ],),
                  )
                ],
              ),
              

              const SizedBox( height: 210.0 ),


              Container(
                height: MediaQuery.of( createUserAccountContext  ).size.height *0.065,
                width: MediaQuery.of(  createUserAccountContext ).size.width *0.351,
                child: ElevatedButton(
                  style: ButtonStyle(
                      textStyle: WidgetStateProperty.all<TextStyle>( const TextStyle( color: Color.fromARGB(255, 255, 255, 255),  ) ),
                      backgroundColor: WidgetStateProperty.all<Color>( Theme.of( createUserAccountContext).colorScheme.secondary, ),
                      shape: WidgetStateProperty.all<OutlinedBorder>( //  MaterialStateProperty.all  ->  RoundedRectangleBorder(
                          const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all( Radius.circular(30.0) ),
                          )
                      ),
                  ),
                  onPressed: () async {

                    if( this._nicknameInput == "" ){
                        ScaffoldMessenger.of( createUserAccountContext  ).showSnackBar(
                          SnackBar( 
                            content: const Text("O campo 'E-mail' não pode estar vazio!"),
                            backgroundColor: Theme.of(createUserAccountContext).colorScheme.error,
                          )
                        );

                    }else if( this._passwordInput == "" ){
                        ScaffoldMessenger.of(  createUserAccountContext  ).showSnackBar(
                          SnackBar( 
                            content: const Text("O campo 'Senha' não pode estar vazio!"),
                            backgroundColor:  Theme.of(createUserAccountContext).colorScheme.error, 
                          ),
                        );

                    }else if( this._emailInput == "" ){
                        ScaffoldMessenger.of(  createUserAccountContext  ).showSnackBar(
                          SnackBar( 
                            content: const Text("O campo 'Senha' não pode estar vazio!"),
                            backgroundColor: Theme.of(createUserAccountContext).colorScheme.error,  
                          ),
                        );

                    }else if( !this._emailInput.toString().contains('@')  ){
                        ScaffoldMessenger.of(  createUserAccountContext  ).showSnackBar(
                          SnackBar( 
                            content: const Text("O campo 'E-mail' não contém o caractere '@' "),
                            backgroundColor: Theme.of(createUserAccountContext).colorScheme.error,  
                          )
                        );

                    }else {
                        await new UserService().createAccount( this._emailInput, this._nicknameInput, "",  this._passwordInput, createUserAccountContext );
                    }
                    
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Icon( 
                          Icons.save,
                        //  color: AppColors.WHITE.color 
                        ),
                        const SizedBox( width: 10.0 ),
                        Text(
                          "SALVAR",
                          style: TextStyle(
                              fontSize: 20.0, 
                         //     color: AppColors.WHITE.color,
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

