

class User{

  int? _ID; 
  String _email;
  String _nickName; 
  String _avatar;
  String _password;
  int _score;


  User({
    int? id,
    required String emaill,
    required String nickNamee,
    required String avatarr,
    required String passwordd,
    required int scoree
  }):
    this._ID = id,
    this._email = emaill,
    this._nickName = nickNamee,
    this._avatar = avatarr,
    this._password = passwordd,
    this._score = scoree;



    factory User.fromJSON( Map<String, dynamic> jsonfile ){

      return User(
        id:   jsonfile["id"],
        emaill:  jsonfile["email"],
        nickNamee:   jsonfile["nickName"],
        avatarr:   jsonfile["avatar"],
        passwordd:   jsonfile["password"],
        scoree:   jsonfile["score"],
      );
    }
  
}


