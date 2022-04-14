// ignore_for_file: non_constant_identifier_names
class RegisterRequestModel {
  String? FirstName,
   LastName,
   email,
   phoneNumber,
   companyName,
   password,
   confirmPassword;

  RegisterRequestModel(
      { this.FirstName, this.LastName,
      this.companyName,
      this.phoneNumber,
      this.email,
       this.password, this.confirmPassword,
      
      });

  Map<dynamic, dynamic> toJson() {
    Map<dynamic, dynamic> map = {
      'FirstName': FirstName,
      'LastName': LastName,
      "CUSTOMER_NAME":companyName,
      "Phone":phoneNumber,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
    };
    
    return map;
  }
  
}
