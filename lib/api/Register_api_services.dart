
// ignore_for_file: file_names

import 'package:http/http.dart' as http;
import '../model/register_model.dart';

class APIService {
  Future<bool> register(RegisterRequestModel requestModel) async {
    String url = "http://172.29.1.208:2016/Api/Register";

    final response =
        await http.post(Uri.parse(url), body: requestModel.toJson());

    if (response.statusCode == 201 || response.statusCode == 400) {
      return true;
    } else {
      return false;
    }
  }
}
