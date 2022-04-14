
class LoginRequestModel {
  String? email;
  String? password;

  LoginRequestModel({
     this.email,
    this.password,
  });


  Map<dynamic, dynamic> toJson() {
    Map<dynamic, dynamic> map = {
      'email': email,
      'password': password,
    };
  
    return map;
  }
}
