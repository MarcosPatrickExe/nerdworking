import 'package:flutter/material.dart';



class Feed extends StatefulWidget{

  @override
  State<Feed> createState() => FeedState();
}



class FeedState extends State<Feed>{

  @override
  Widget build( BuildContext feedContext ){

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of( feedContext ).colorScheme.primary,
        centerTitle: true,
        title: Text("Notícias"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric( horizontal: 40.0 ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Text( 
                  "Seja bem-vindo(a) !", 
                  style:  TextStyle( 
                    color: Theme.of( feedContext ).colorScheme.onSurface, 
                    fontSize: 26.0
                  ) 
                ),
            ],
          ),
        ),
      ),
      

      bottomNavigationBar: BottomNavigationBar(

          currentIndex: 0,
          items: const <BottomNavigationBarItem>[

              BottomNavigationBarItem( 
                icon: Icon( Icons.home ),
                label: "Publicações"
              ),

              BottomNavigationBarItem( 
                icon:  Icon( Icons.search ),
                label: "Pesquisar"
              ),

              BottomNavigationBarItem( 
                icon:  Icon( Icons.notifications ),
                label: "Notificações"
              ),

              BottomNavigationBarItem( 
                icon:  Icon( Icons.person ),
                label: "Meu perfil"
              ),
          ],
          onTap: (int index){
              print( " Indexxxx: "+index.toString() );

              if( index == -1 ){
               //   Navigator.push( feedContext, MaterialPageRoute( builder: (context) => CreateUserAccount( ) ), );
              }else{
              
                showDialog<void>(
                  context: feedContext,
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
                                      child: Image.asset("assets/nerdworking_512.png"),
                                    ),
                                    const SizedBox( height: 17.0, ),
                                    const Text( "Funcionalidade ainda em desenvolvimento! ", style: TextStyle( fontSize: 22.0), ),
                                    const Text( "Todos os direitos reservados. ", style: TextStyle( fontSize: 16.0), ),
                                    const Text( "E-mail: marcospatrick.dev@gmail.com", style: TextStyle( fontSize: 13.0), ),
                                    const Text( "Instagem: @patrick_saraiva", style: TextStyle( fontSize: 13.0), ),
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

    );
      
  }
}





