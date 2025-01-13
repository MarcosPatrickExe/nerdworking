import 'package:flutter/material.dart';
import '../repositories/UserRepository.dart';
import '../../view/pages/Feed.dart';
 


class UserService{ 

  UserRepository _userRepository;
  UserService(): this._userRepository = UserRepository();


  Future<void> loginService( String email, String password, BuildContext ctx ) async {
    //  this._userRepository.login( email, password );

    Navigator.push( ctx, MaterialPageRoute( builder: (context) => Feed( ) ), );
      
  }


  Future<void> createAccount(  String email, String nickName, String avatar, String password, BuildContext createUserCtx ) async{

    int status = await this._userRepository.signup(nickName, avatar, email, password);
  
  }

}




// diferencas entre DAO, respositories, service e controller
// https://pt.stackoverflow.com/questions/85316/diferen%C3%A7a-de-service-repositories-e-controller#:~:text=Por%C3%A9m%2C%20se%20voc%C3%AA%20a%20implementou,%2Fconsultas%2Fatualiza%C3%A7%C3%B5es%2Fremo%C3%A7%C3%B5es.




// theme data on flutter

// https://medium.com/@amazing_gs/complete-flutter-guide-how-to-implement-dark-mode-dynamic-theming-and-theme-switching-ddabaef48d5a#:~:text=Setting%20themes%20in%20Flutter%20is,%2C%20just%20add%20darkTheme%3A%20ThemeData.
