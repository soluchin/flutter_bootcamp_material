import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserModel {
  final int id;
  final String firstname;
  final String lastname;
  final String email;
  final int gender;

  const UserModel(
      {required this.id,
      required this.firstname,
      required this.lastname,
      required this.email,
      required this.gender});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json["userid"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        gender: json["gender"]);
  }
}

String ipadress = "192.168.1.10";

Future<List<UserModel>> getAllUser() async {
  final response =
      await http.get(Uri.parse("http://${ipadress}:1882/api/getuser"));
  print(response.body);
  Iterable i = jsonDecode(response.body);
  List<UserModel> usersData =
      List<UserModel>.from(i.map((e) => UserModel.fromJson(e)));
  if (response.statusCode == 200) {
    return usersData;
  } else {
    throw Exception('Failed to load album');
  }
}

Future<http.Response> createUser(UserModel data) {
  return http.post(Uri.parse("http://${ipadress}:1882/api/createuser"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'firstname': data.firstname,
        'lastname': data.lastname,
        'email': data.email,
        'gender': data.gender
      }));
}

Future<http.Response> updateUser(int id, UserModel data) {
  return http.put(Uri.parse("http://${ipadress}:1882/api/updateuser/${id}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'firstname': data.firstname,
        'lastname': data.lastname,
        'email': data.email,
        'gender': data.gender
      }));
}

Future<http.Response> deleteUser(int id) {
  return http.delete(Uri.parse("http://${ipadress}:1882/api/deleteuser/${id}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });
}
