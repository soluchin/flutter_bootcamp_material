import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Module16App extends StatelessWidget {
  const Module16App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Get Data From Api"),
        ),
        body: Container(child: UsingTheData()),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            postData({"name": "post method", "email": "testpost@gmail.com"});
            ;
          },
        ),
      ),
    );
  }
}

class PrintResponseBody extends StatelessWidget {
  const PrintResponseBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<http.Response>(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.body);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return Center(child: const CircularProgressIndicator());
        ;
      },
    );
  }
}

class UsingTheData extends StatefulWidget {
  UsingTheData({super.key});

  @override
  State<UsingTheData> createState() => _UsingTheDataState();
}

class _UsingTheDataState extends State<UsingTheData> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData().then((value) => value.body),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<dynamic> decoded = jsonDecode(snapshot.data!);
            // List<dynamic> decoded = jsonDecode(snapshot.data!)["data"];
            return ListView.builder(
              itemCount: decoded.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading:
                      CircleAvatar(child: Text("${decoded[index]["name"][0]}")),
                  title: Text("${decoded[index]["name"]}"),
                  subtitle: Text("${decoded[index]["email"]}"),
                  onTap: () {},
                  trailing: PopupMenuButton(
                    itemBuilder: (context) {
                      return <PopupMenuEntry>[
                        PopupMenuItem(
                          child: Text("edit"),
                          onTap: () {
                            updateData(index + 1, {
                              "name": "update data",
                              "email": "updatedata@gmail.com"
                            });
                          },
                        ),
                        PopupMenuItem(
                          child: Text("delete"),
                          onTap: () {
                            deleteData(index + 1);
                          },
                        )
                      ];
                    },
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Center(child: const CircularProgressIndicator());
          ;
        });
  }
}

Future<http.Response> getData() async {
  final response =
      await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
  // await http.get(Uri.parse("https://reqres.in/api/users?per_page=15"));
  // await Future.delayed(const Duration(seconds: 2));
  return response;
}

Future<http.Response> postData(Map<String, String> data) async {
  // data object example
  // data = {"name": "post method", "email": "postmethod@test.con"};
  final response =
      await http.post(Uri.parse("https://jsonplaceholder.typicode.com/users"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(data));
  print(response.statusCode);
  print(response.body);
  return response;
}

Future<http.Response> updateData(int id, Map<String, String> data) async {
  // data object example
  // data = {"name": "post method", "email": "postmethod@test.con"};
  final response = await http.put(
      Uri.parse("https://jsonplaceholder.typicode.com/users/${id}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data));
  print(response.statusCode);
  print(response.body);
  return response;
}

Future<http.Response> deleteData(id) async {
  // data object example
  // data = {"name": "post method", "email": "postmethod@test.con"};
  final response = await http.delete(
    Uri.parse("https://jsonplaceholder.typicode.com/users/${id}"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  print(response.statusCode);
  print(response.body);
  return response;
}
