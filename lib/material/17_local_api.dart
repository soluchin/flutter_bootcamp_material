import 'package:flutter/material.dart';
import 'package:bootcamp_material/material/module17_resources/add_user_form.dart';
import 'package:bootcamp_material/material/module17_resources/show_user_data.dart';
import 'package:bootcamp_material/material/module17_resources/update_user_form.dart';
import 'package:bootcamp_material/material/module17_resources/user_model.dart';

class Module17App extends StatelessWidget {
  const Module17App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => const ApiApp(),
        "/adduser": (context) => const AddUser(),
        "/updateuser": (context) => const UpdateUser()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class ApiApp extends StatelessWidget {
  const ApiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pengguna Terdaftar")),
      body: SafeArea(child: ShowUser()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/adduser");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddUser extends StatelessWidget {
  const AddUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambahkan Pengguna"),
      ),
      body: SafeArea(child: AddUserForm()),
    );
  }
}

class UpdateUser extends StatelessWidget {
  const UpdateUser({super.key});

  @override
  Widget build(BuildContext context) {
    final UserModel oldValue =
        ModalRoute.of(context)!.settings.arguments as UserModel;
    return Scaffold(
      appBar: AppBar(
        title: Text("Ubah Pengguna"),
      ),
      body: SafeArea(
          child: UpdateUserForm(
        oldValue: oldValue,
      )),
    );
  }
}
