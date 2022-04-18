// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables, file_names, non_constant_identifier_names, avoid_print
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gcg_ec/model/salesOrder.dart';
import 'package:gcg_ec/model/salesOrderLineApi.dart';



import '../model/user.dart';

class getData {
  var name;
  Future<List<User>> fetchUsers(url) async {
    var response = await Dio().get(url);
    if (response.statusCode == 200) {
      var getUsersData = response.data as List;
      var listUsers = getUsersData.map((i) {
        return User.fromJson(i);
      }).toList();
      return listUsers;
    } else {
      throw Exception('Failed to load users');
    }
  }
}

class getData2 {
  Future<List<salesOrderApi>> fetchUsers(url) async {
    var response = await Dio().get(url);
    if (response.statusCode == 200) {
      var getUsersData = response.data as Map<String, dynamic>;
      var listUsers = getUsersData.values.map((i) {
        return salesOrderApi.fromJson(i);
      }).toList();
      return listUsers;
    } else {
      throw Exception('Failed to load users');
    }
  }
}

class getData3 {
  Future<List<salesOrderDetailsApi>> fetchUsers(url) async {
    var response = await Dio().get(url);
    if (response.statusCode == 200) {
      var getUsersData = response.data as Map<String, dynamic>;
      var listUsers = getUsersData.values.map((i) {
        print(i); //owais removed
        return salesOrderDetailsApi.fromJson(i);
      }).toList();
      return listUsers;
    } else {
      throw Exception('Failed to load users');
    }
  }
}


































