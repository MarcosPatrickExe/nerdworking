

class User{

  int _ID;
  String _email;
  String _nickName;
  String _avatar;
  String _password;
  int _score;


  User({
    required int id,
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
  
}


