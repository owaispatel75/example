// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/login_model.dart';

class APIService {
  static var response;
  Future login(LoginRequestModel requestModel) async {
    String url = "http://172.29.1.208:2016/Api/Login";
    response = await http.post(Uri.parse(url), body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return true;
    } else {
      return false;
    }
  }

  static int idValue(data) {
    var api_data = data.body;
    var Customer_id = jsonDecode(api_data);
    var id_value = Customer_id["Customer_Id"];
    return id_value;
  }
}
