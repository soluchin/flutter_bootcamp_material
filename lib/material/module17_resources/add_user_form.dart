import 'package:flutter/material.dart';
import 'package:validators/validators.dart' as validators;
import 'package:bootcamp_material/material/module17_resources/user_model.dart';

class AddUserForm extends StatefulWidget {
  const AddUserForm({super.key});

  @override
  State<AddUserForm> createState() => _AddUserFormState();
}

class _AddUserFormState extends State<AddUserForm> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  UserModel? data;
  String? fn;
  String? ln;
  String? email;
  int? gender = 1;

  List<String> _genders = ["wanita", "pria"];

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              decoration:
                  InputDecoration(hintText: "john", labelText: "nama depan"),
              onChanged: (newValue) {
                setState(() {
                  fn = newValue;
                });
              },
            ),
            TextFormField(
              decoration:
                  InputDecoration(hintText: "john", labelText: "nama belakang"),
              onChanged: (newValue) {
                setState(() {
                  ln = newValue;
                });
              },
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  hintText: "youremail@example.com", labelText: "email adress"),
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text("gender:"),
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) {
                return RadioListTile(
                  title: Text("${_genders[index]}"),
                  groupValue: gender,
                  value: index,
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                );
              },
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() async {
                    data = new UserModel(
                        id: 0,
                        firstname: fn!,
                        lastname: ln!,
                        email: email!,
                        gender: gender!);
                    await createUser(data!);
                    Navigator.pushNamed(context, "/");
                  });
                },
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
