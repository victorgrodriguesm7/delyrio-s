
class User{
  String email;
  String uid;
  String token;
  
  User(
    this.email,
    this.uid,
    this.token
  );
  
  User.fromJson(Map<String, dynamic> json, String email)
  : this.email = email,
    uid = json['uid'],
    token = json['token'];
}