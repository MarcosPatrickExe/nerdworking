import '../model/User.dart';


abstract class userDAO{

  Future<void> login( String email, String password ); 

  Future<void> signup( String nickName, String avatar, String email, String password ); 

  Future<bool> deleteAccountByID( int userID, String email ); 

  Future<bool> updateAccountDataByID( int userID, User user ); 

}


