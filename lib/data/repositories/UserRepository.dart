import '../../domain/business/userDAO.dart';  
import '../../domain/model/User.dart'; 

 
// OMLY CRUD ACCESS
class UserRepository extends UserDAO{

  Future<void> login( String email, String password ){ 
      return Future.value(false);
  }
  
  Future<int> signup( String nickName, String avatar, String email, String password ){  throw Error(); }

  Future<bool> deleteAccountByID( int userID, String email ){ return Future.value(false);  }

  Future<bool> updateAccountDataByID( int userID, User user ){  return Future.value(false);  }

}



