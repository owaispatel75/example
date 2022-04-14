// ignore_for_file: non_constant_identifier_names
class UserDetails {
  String? FirstName, LastName, email, password, confirmPassword;
  int? id;

  UserDetails({
    this.id,
    this.FirstName,
    this.LastName,
    this.email,
    this.password,
  });

  Map<dynamic, dynamic> toJson() {
    Map<dynamic, dynamic> map = {
      "Customer_id": id,
      'FirstName': FirstName,
      'LastName': LastName,
      'email': email,
      'password': password,
    };

    return map;
  }
}
